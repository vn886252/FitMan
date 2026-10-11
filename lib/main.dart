import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app/gymmane_app.dart';
import 'services/alarm_store.dart';
import 'services/cloud_sync_service.dart';
import 'services/device_kind.dart';
import 'services/home_widget_bridge.dart';
import 'services/live_workout.dart';
import 'services/local_store.dart';
import 'services/media_store.dart';
import 'services/rest_alarm.dart';
import 'services/screen_awake.dart';
import 'services/subscription_service.dart';
import 'state/fit_state.dart';
import 'wear/wear_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarContrastEnforced: false,
    systemStatusBarContrastEnforced: false,
  ));

  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    debugPrint('FitMan Error: ${details.exceptionAsString()}');
  };

  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Material(
      color: const Color(0xFF141414),
      child: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.fitness_center_rounded, color: Color(0xFFF47E1D), size: 48),
                const SizedBox(height: 16),
                Text(
                  '${"FitMan đang đồng bộ lại giao diện..."}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () {
                    fit.resetRoute('home');
                    fit.persistNow();
                  },
                  child: Text(
                    '${"Chạm để quay về Trang Chủ"}',
                    style: const TextStyle(color: Color(0xFFF47E1D), fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  };

  await initializeDateFormatting();
  await Store.instance.init();
  await MediaStore.init();
  await AlarmStore.init();
  fit.loadFromStore();
  CloudSyncService.instance.init();
  await SubscriptionService.instance.init();
  await RestAlarm.instance.init();
  fit.syncPhotoReminder();
  fit.syncTrainReminder();

  final watch = await DeviceKind.isWatch();
  _onWatch = watch;
  fit.addListener(_sessionSideEffects);
  _sessionSideEffects();

  if (watch) {
    runApp(const WearApp());
    return;
  }

  fit.onWidgetsShouldUpdate = HomeWidgetBridge.update;
  runApp(const GymManeApp());

  WidgetsBinding.instance.addPostFrameCallback((_) => HomeWidgetBridge.update());
}

bool _onWatch = false;

void _sessionSideEffects() {
  if (!_onWatch) LiveWorkout.sync();
  final live = fit.isSessionActive && fit.session?.manual == false;
  ScreenAwake.keepOn(fit.keepScreenOn && live);
}
