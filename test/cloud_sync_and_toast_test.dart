import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gymmane/app/gymmane_app.dart';
import 'package:gymmane/screens/onboarding_screen.dart';
import 'package:gymmane/screens/settings_screen.dart';
import 'package:gymmane/services/local_store.dart';
import 'package:gymmane/state/fit_state.dart';
import 'package:gymmane/widgets/liquid_notch.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await Store.instance.init();
    fit.loadFromStore();
    fit.onboarded = true;
  });

  testWidgets('CloudSyncSheet draws without throwing when not logged in', (tester) async {
    await tester.pumpWidget(const GymManeApp());
    await tester.pumpAndSettle();

    final BuildContext context = tester.element(find.byType(Navigator));
    showCloudSyncSheetForTest(context);
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
  });

  testWidgets('showNotchToast does not throw when called from bottom sheet context', (tester) async {
    await tester.pumpWidget(const GymManeApp());
    await tester.pumpAndSettle();

    final BuildContext context = tester.element(find.byType(Navigator));
    showCloudSyncSheetForTest(context);
    await tester.pumpAndSettle();

    final sheetContext = tester.element(find.byType(SingleChildScrollView).last);
    showNotchToast(
      sheetContext,
      'Đăng nhập ẩn danh thành công!',
      icon: PhosphorIconsRegular.checkCircle,
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    expect(tester.takeException(), isNull);
  });

  testWidgets('OnboardingScreen draws all steps and finishes cleanly', (tester) async {
    fit.onboarded = false;
    await tester.pumpWidget(const GymManeApp());
    expect(find.byType(OnboardingScreen), findsOneWidget);
    final err = tester.takeException();
    expect(err, isNull);
  });
}
