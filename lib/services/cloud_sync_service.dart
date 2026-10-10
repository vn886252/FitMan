import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../state/fit_state.dart';

class CloudSyncService extends ChangeNotifier {
  CloudSyncService._();
  static final CloudSyncService instance = CloudSyncService._();

  bool _initialized = false;
  bool _isSyncing = false;
  DateTime? _lastSyncTime;
  String? _lastError;

  bool get isInitialized => _initialized;
  bool get isSyncing => _isSyncing;
  DateTime? get lastSyncTime => _lastSyncTime;
  String? get lastError => _lastError;
  bool get isLoggedIn => _initialized && FirebaseAuth.instance.currentUser != null;
  User? get currentUser => _initialized ? FirebaseAuth.instance.currentUser : null;

  static const String _prefLastSyncKey = 'fitman_last_cloud_sync';

  Future<void> init() async {
    try {
      if (Firebase.apps.isEmpty) {
        await Firebase.initializeApp();
      }
      _initialized = true;

      final prefs = await SharedPreferences.getInstance();
      final savedSync = prefs.getString(_prefLastSyncKey);
      if (savedSync != null) {
        _lastSyncTime = DateTime.tryParse(savedSync);
      }

      FirebaseAuth.instance.authStateChanges().listen((user) {
        notifyListeners();
        if (user != null) {
          // Tự động đồng bộ nền khi người dùng đăng nhập
          syncToCloud();
        }
      });
    } catch (e) {
      // Firebase chưa được cấu hình hoặc chạy trong môi trường không hỗ trợ
      _initialized = false;
      _lastError = e.toString();
      debugPrint('Firebase not initialized: $e');
    }
    notifyListeners();
  }

  /// Đăng ký tài khoản mới bằng Email/Mật khẩu
  Future<String?> register(String email, String password) async {
    if (!_initialized) return 'Dịch vụ đám mây chưa được kích hoạt.';
    try {
      _lastError = null;
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      await syncToCloud();
      return null;
    } on FirebaseAuthException catch (e) {
      _lastError = e.message;
      return e.message ?? 'Đăng ký thất bại';
    } catch (e) {
      _lastError = e.toString();
      return 'Lỗi không xác định: $e';
    }
  }

  /// Đăng nhập bằng Email/Mật khẩu
  Future<String?> signIn(String email, String password) async {
    if (!_initialized) return 'Dịch vụ đám mây chưa được kích hoạt.';
    try {
      _lastError = null;
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      await restoreFromCloud();
      return null;
    } on FirebaseAuthException catch (e) {
      _lastError = e.message;
      return e.message ?? 'Đăng nhập thất bại';
    } catch (e) {
      _lastError = e.toString();
      return 'Lỗi không xác định: $e';
    }
  }

  /// Đăng nhập nhanh ẩn danh (Tự tạo tài khoản đám mây cho thiết bị hiện tại)
  Future<String?> signInAnonymously() async {
    if (!_initialized) return 'Dịch vụ đám mây chưa được kích hoạt.';
    try {
      _lastError = null;
      await FirebaseAuth.instance.signInAnonymously();
      await syncToCloud();
      return null;
    } on FirebaseAuthException catch (e) {
      _lastError = e.message;
      return e.message ?? 'Đăng nhập thất bại';
    } catch (e) {
      _lastError = e.toString();
      return 'Lỗi không xác định: $e';
    }
  }

  /// Đăng xuất
  Future<void> signOut() async {
    if (!_initialized) return;
    await FirebaseAuth.instance.signOut();
    notifyListeners();
  }

  /// Tải dữ liệu từ máy lên Đám mây (Cloud Firestore)
  Future<bool> syncToCloud() async {
    if (!_initialized || !isLoggedIn || _isSyncing) return false;

    _isSyncing = true;
    _lastError = null;
    notifyListeners();

    try {
      final user = FirebaseAuth.instance.currentUser!;
      final exportData = fit.exportJson();
      final dataMap = jsonDecode(exportData) as Map<String, dynamic>;

      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'updatedAt': FieldValue.serverTimestamp(),
        'email': user.email ?? 'anonymous',
        'backup': dataMap,
      }, SetOptions(merge: true));

      _lastSyncTime = DateTime.now();
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_prefLastSyncKey, _lastSyncTime!.toIso8601String());

      _isSyncing = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isSyncing = false;
      _lastError = e.toString();
      debugPrint('Cloud sync error: $e');
      notifyListeners();
      return false;
    }
  }

  /// Khôi phục dữ liệu từ Đám mây về máy
  Future<bool> restoreFromCloud() async {
    if (!_initialized || !isLoggedIn || _isSyncing) return false;

    _isSyncing = true;
    _lastError = null;
    notifyListeners();

    try {
      final user = FirebaseAuth.instance.currentUser!;
      final doc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();

      if (doc.exists && doc.data() != null) {
        final backup = doc.data()!['backup'];
        if (backup != null) {
          final jsonString = jsonEncode(backup);
          final ok = fit.importJson(jsonString);
          if (ok) {
            fit.persistNow();
            _lastSyncTime = DateTime.now();
            final prefs = await SharedPreferences.getInstance();
            await prefs.setString(_prefLastSyncKey, _lastSyncTime!.toIso8601String());
            _isSyncing = false;
            notifyListeners();
            return true;
          }
        }
      }
      _isSyncing = false;
      notifyListeners();
      return false;
    } catch (e) {
      _isSyncing = false;
      _lastError = e.toString();
      debugPrint('Cloud restore error: $e');
      notifyListeners();
      return false;
    }
  }
}
