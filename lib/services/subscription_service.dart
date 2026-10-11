import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'cloud_sync_service.dart';

/// Dịch vụ quản lý 7 ngày dùng thử miễn phí và Gói thành viên VIP (FitMan Pro)
class SubscriptionService extends ChangeNotifier {
  SubscriptionService._();
  static final SubscriptionService instance = SubscriptionService._();

  static const String _prefTrialStartKey = 'fitman_trial_start_date';
  static const String _prefIsVipKey = 'fitman_is_vip';
  static const String _prefVipPlanKey = 'fitman_vip_plan'; // 'lifetime' hoặc 'weekly'
  static const String _prefVipExpiresKey = 'fitman_vip_expires_date';

  static const int kTrialDays = 7;
  static const int kEarlyBirdHours = 48; // 2 ngày ưu đãi giảm giá 199k
  static const int kEarlyBirdTotalSlots = 200; // Giới hạn 200 người đầu tiên

  DateTime? _trialStartDate;
  bool _isVip = false;
  String _vipPlan = '';
  DateTime? _vipExpiresDate;

  Timer? _tickerTimer;

  bool get isInitialized => _trialStartDate != null;
  bool get isVip => _isVip;
  String get vipPlan => _vipPlan;
  DateTime? get trialStartDate => _trialStartDate;

  /// Thời điểm kết thúc 7 ngày dùng thử
  DateTime get trialEndsDate {
    final start = _trialStartDate ?? DateTime.now();
    return start.add(const Duration(days: kTrialDays));
  }

  /// Thời điểm kết thúc đợt ưu đãi Early Bird 199k (2 ngày sau khi bắt đầu dùng)
  DateTime get earlyBirdEndsDate {
    final start = _trialStartDate ?? DateTime.now();
    return start.add(const Duration(hours: kEarlyBirdHours));
  }

  /// Còn trong thời gian 7 ngày dùng thử miễn phí hay không
  bool get isTrialActive {
    if (_isVip) return true;
    final now = DateTime.now();
    return now.isBefore(trialEndsDate);
  }

  /// Người dùng có quyền truy cập ứng dụng hay không (VIP hoặc còn hạn dùng thử)
  bool get hasAccess {
    if (_isVip) {
      if (_vipPlan == 'lifetime') return true;
      if (_vipExpiresDate != null && DateTime.now().isBefore(_vipExpiresDate!)) {
        return true;
      }
      return false;
    }
    return isTrialActive;
  }

  /// Số ngày dùng thử còn lại (làm tròn lên từ 0 đến 7)
  int get trialDaysRemaining {
    if (_isVip) return kTrialDays;
    final now = DateTime.now();
    final remaining = trialEndsDate.difference(now);
    if (remaining.isNegative) return 0;
    return (remaining.inHours / 24).ceil().clamp(0, kTrialDays);
  }

  /// Thời gian đếm ngược của đợt giảm giá 199k (2 ngày)
  Duration get earlyBirdTimeRemaining {
    final now = DateTime.now();
    final diff = earlyBirdEndsDate.difference(now);
    return diff.isNegative ? Duration.zero : diff;
  }

  bool get isEarlyBirdActive => earlyBirdTimeRemaining.inSeconds > 0;

  /// Số suất ưu đãi 199k còn lại (giảm dần từ 200 theo thời gian tạo cảm giác cấp bách)
  int get remainingEarlyBirdSlots {
    final now = DateTime.now();
    final start = _trialStartDate ?? now;
    final elapsedHours = now.difference(start).inMinutes / 60.0;
    // Bắt đầu còn khoảng 38/200 suất và giảm dần theo giờ, tối thiểu còn 7 suất
    final claimed = (162 + (elapsedHours * 0.75)).floor();
    final left = (kEarlyBirdTotalSlots - claimed).clamp(7, 45);
    return left;
  }

  /// Chuỗi hiển thị trạng thái gói hiện tại
  String get statusBadgeText {
    if (_isVip) {
      return _vipPlan == 'lifetime' ? 'VIP Trọn Đời' : 'VIP 1 Tuần';
    }
    if (isTrialActive) {
      return 'Dùng thử: còn $trialDaysRemaining ngày';
    }
    return 'Hết hạn dùng thử';
  }

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();

    // 1. Kiểm tra ngày bắt đầu dùng thử
    final savedTrial = prefs.getString(_prefTrialStartKey);
    if (savedTrial != null) {
      _trialStartDate = DateTime.tryParse(savedTrial);
    }
    if (_trialStartDate == null) {
      _trialStartDate = DateTime.now();
      await prefs.setString(_prefTrialStartKey, _trialStartDate!.toIso8601String());
    }

    // 2. Kiểm tra trạng thái VIP
    _isVip = prefs.getBool(_prefIsVipKey) ?? false;
    _vipPlan = prefs.getString(_prefVipPlanKey) ?? '';
    final savedExpires = prefs.getString(_prefVipExpiresKey);
    if (savedExpires != null) {
      _vipExpiresDate = DateTime.tryParse(savedExpires);
    }

    // Kiểm tra nếu là gói tuần đã hết hạn
    if (_isVip && _vipPlan == 'weekly' && _vipExpiresDate != null) {
      if (DateTime.now().isAfter(_vipExpiresDate!)) {
        _isVip = false;
        await prefs.setBool(_prefIsVipKey, false);
      }
    }

    // Khởi động bộ đếm giây cập nhật countdown thời gian thực
    _tickerTimer?.cancel();
    _tickerTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      notifyListeners();
    });

    notifyListeners();
  }

  /// Kích hoạt gói VIP (plan: 'lifetime' hoặc 'weekly')
  Future<void> activateVip({required String plan}) async {
    final prefs = await SharedPreferences.getInstance();
    _isVip = true;
    _vipPlan = plan;

    if (plan == 'weekly') {
      _vipExpiresDate = DateTime.now().add(const Duration(days: 7));
      await prefs.setString(_prefVipExpiresKey, _vipExpiresDate!.toIso8601String());
    } else {
      _vipExpiresDate = null;
      await prefs.remove(_prefVipExpiresKey);
    }

    await prefs.setBool(_prefIsVipKey, true);
    await prefs.setString(_prefVipPlanKey, _vipPlan);

    // Đồng bộ trạng thái VIP lên Cloud nếu đang đăng nhập
    try {
      if (CloudSyncService.instance.isLoggedIn) {
        await CloudSyncService.instance.syncToCloud();
      }
    } catch (_) {}

    notifyListeners();
  }

  /// Khôi phục giao dịch hoặc hủy kích hoạt (phục vụ test)
  Future<void> setTrialTesting({required int daysAgo}) async {
    final prefs = await SharedPreferences.getInstance();
    _trialStartDate = DateTime.now().subtract(Duration(days: daysAgo));
    _isVip = false;
    _vipPlan = '';
    await prefs.setString(_prefTrialStartKey, _trialStartDate!.toIso8601String());
    await prefs.setBool(_prefIsVipKey, false);
    await prefs.remove(_prefVipPlanKey);
    notifyListeners();
  }

  @override
  void dispose() {
    _tickerTimer?.cancel();
    super.dispose();
  }
}
