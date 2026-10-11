import 'package:flutter_test/flutter_test.dart';
import 'package:gymmane/services/subscription_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  test('New user starts with 7-day free trial and has access', () async {
    final sub = SubscriptionService.instance;
    await sub.init();

    expect(sub.isVip, false);
    expect(sub.isTrialActive, true);
    expect(sub.hasAccess, true);
    expect(sub.trialDaysRemaining, 7);
    expect(sub.isEarlyBirdActive, true);
    expect(sub.remainingEarlyBirdSlots, greaterThan(0));
    expect(sub.statusBadgeText, contains('Dùng thử: còn 7 ngày'));
  });

  test('Activating Lifetime VIP grants permanent access', () async {
    final sub = SubscriptionService.instance;
    await sub.init();

    await sub.activateVip(plan: 'lifetime');
    expect(sub.isVip, true);
    expect(sub.vipPlan, 'lifetime');
    expect(sub.hasAccess, true);
    expect(sub.statusBadgeText, 'VIP Trọn Đời');
  });

  test('Activating Weekly VIP grants 7-day access', () async {
    final sub = SubscriptionService.instance;
    await sub.init();

    await sub.activateVip(plan: 'weekly');
    expect(sub.isVip, true);
    expect(sub.vipPlan, 'weekly');
    expect(sub.hasAccess, true);
    expect(sub.statusBadgeText, 'VIP 1 Tuần');
  });

  test('Expired trial without VIP denies access', () async {
    final sub = SubscriptionService.instance;
    await sub.init();

    // Giả lập ngày bắt đầu là 8 ngày trước
    await sub.setTrialTesting(daysAgo: 8);
    expect(sub.isTrialActive, false);
    expect(sub.hasAccess, false);
    expect(sub.trialDaysRemaining, 0);
    expect(sub.statusBadgeText, 'Hết hạn dùng thử');
  });
}
