import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:gymmane/catalog/program_templates.dart';
import 'package:gymmane/data/vietnamese_meals.dart';
import 'package:gymmane/services/local_store.dart';
import 'package:gymmane/state/fit_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await Store.instance.init();
    fit.weeklyPlan.clear();
    fit.routines.clear();
  });

  test('selecting a routine template allocates the weekly workout schedule', () {
    // Ban đầu chưa có lịch tập
    expect(fit.weeklyPlan.isEmpty, isTrue);

    // Người dùng chọn giáo án Giảm Cân & Đốt Mỡ Nhanh (3 ngày)
    final template = kProgramTemplates.firstWhere((t) => t.id == 'weight_loss_cut');
    final made = fit.applyTemplate(template, forceSchedule: true);

    expect(made, greaterThan(0));
    // Lịch tuần phải có đủ các thứ trong tuần mà giáo án thiết lập (Thứ 2, 4, 6)
    expect(fit.weeklyPlan.containsKey(1), isTrue); // Thứ 2
    expect(fit.weeklyPlan.containsKey(3), isTrue); // Thứ 4
    expect(fit.weeklyPlan.containsKey(5), isTrue); // Thứ 6
  });

  test('selecting a routine template allocates full 7-day Vietnamese meal plan', () {
    // Phân bổ lịch ăn cho mục tiêu giảm mỡ (cut)
    applyDefaultWeeklyMealPlan('cut');

    final raw = Store.instance.note('vietnamese_meals_eaten');
    expect(raw, isNotNull);
    expect(raw!.isNotEmpty, isTrue);

    final decoded = jsonDecode(raw) as Map<String, dynamic>;
    const days = ['Thứ 2', 'Thứ 3', 'Thứ 4', 'Thứ 5', 'Thứ 6', 'Thứ 7', 'Chủ Nhật'];
    for (final day in days) {
      expect(decoded.containsKey(day), isTrue, reason: 'Lịch ăn phải chứa $day');
      final meals = decoded[day] as Map<String, dynamic>;
      expect(meals.isNotEmpty, isTrue, reason: '$day phải có các món ăn phân bổ');
    }
  });
}
