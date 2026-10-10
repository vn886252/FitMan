import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

import '../data/vietnamese_meals.dart';
import '../l10n/l10n.dart';
import '../models/profile.dart';
import '../services/local_store.dart';
import '../state/fit_state.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../widgets/ui_kit.dart';

class MealsScreen extends StatefulWidget {
  const MealsScreen({super.key});

  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  static const _days = ['Thứ 2', 'Thứ 3', 'Thứ 4', 'Thứ 5', 'Thứ 6', 'Thứ 7', 'Chủ Nhật'];
  String _selectedDay = 'Thứ 2';

  final _searchController = TextEditingController();
  String _searchQuery = '';
  String _selectedCategory = 'all';

  static const _categoryTabs = [
    ('all', 'Tất cả', '✨'),
    ('pre_workout', 'Trước tập', '⚡'),
    ('post_workout', 'Sau tập', '💪'),
    ('breakfast', 'Bữa sáng', '☀️'),
    ('lunch', 'Bữa trưa', '🍲'),
    ('dinner', 'Bữa tối', '🌙'),
    ('snack', 'Bữa phụ', '🍌'),
  ];

  // Map<Day, Map<MealId, PortionFactor>>
  Map<String, Map<String, double>> _eatenByDay = {};
  // Map<Day, WaterInMl>
  Map<String, int> _waterByDay = {};

  @override
  void initState() {
    super.initState();
    _loadEatenMeals();
    _loadWater();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _loadEatenMeals() {
    final raw = Store.instance.note('vietnamese_meals_eaten');
    if (raw != null && raw.isNotEmpty) {
      try {
        final decoded = jsonDecode(raw) as Map<String, dynamic>;
        setState(() {
          _eatenByDay = decoded.map((k, v) {
            if (v is List) {
              return MapEntry(k, {for (final id in v) id.toString(): 1.0});
            } else if (v is Map) {
              return MapEntry(
                k,
                v.map((mk, mv) => MapEntry(mk.toString(), (mv as num).toDouble())),
              );
            }
            return MapEntry(k, <String, double>{});
          });
        });
      } catch (_) {}
    }
  }

  void _saveEatenMeals() {
    Store.instance.setNote('vietnamese_meals_eaten', jsonEncode(_eatenByDay));
  }

  void _loadWater() {
    final raw = Store.instance.note('vietnamese_water_log');
    if (raw != null && raw.isNotEmpty) {
      try {
        final decoded = jsonDecode(raw) as Map<String, dynamic>;
        setState(() {
          _waterByDay = decoded.map((k, v) => MapEntry(k, (v as num).toInt()));
        });
      } catch (_) {}
    }
  }

  void _saveWater() {
    Store.instance.setNote('vietnamese_water_log', jsonEncode(_waterByDay));
  }

  void _addWater(int ml) {
    HapticFeedback.lightImpact();
    setState(() {
      final current = _waterByDay[_selectedDay] ?? 0;
      final next = (current + ml).clamp(0, 8000);
      _waterByDay[_selectedDay] = next;
    });
    _saveWater();
  }

  void _resetWater() {
    HapticFeedback.selectionClick();
    setState(() {
      _waterByDay[_selectedDay] = 0;
    });
    _saveWater();
  }

  void _toggleMeal(String mealId, [double factor = 1.0]) {
    HapticFeedback.selectionClick();
    setState(() {
      final dayMap = _eatenByDay[_selectedDay] ?? <String, double>{};
      if (dayMap.containsKey(mealId)) {
        dayMap.remove(mealId);
      } else {
        dayMap[mealId] = factor;
      }
      _eatenByDay[_selectedDay] = dayMap;
    });
    _saveEatenMeals();
  }

  void _setPortion(String mealId, double factor) {
    HapticFeedback.selectionClick();
    setState(() {
      final dayMap = _eatenByDay[_selectedDay] ?? <String, double>{};
      if (factor <= 0) {
        dayMap.remove(mealId);
      } else {
        dayMap[mealId] = factor;
      }
      _eatenByDay[_selectedDay] = dayMap;
    });
    _saveEatenMeals();
  }

  double? _getPortion(String mealId) {
    return _eatenByDay[_selectedDay]?[mealId];
  }


  ({int cal, double pro, double carb, double fat}) _getEatenNutrition() {
    final eatenMap = _eatenByDay[_selectedDay] ?? <String, double>{};
    var cal = 0;
    var pro = 0.0;
    var carb = 0.0;
    var fat = 0.0;

    for (final meal in kVietnameseMeals) {
      final factor = eatenMap[meal.id];
      if (factor != null && factor > 0) {
        cal += (meal.calories * factor).round();
        pro += meal.protein * factor;
        carb += meal.carbs * factor;
        fat += meal.fat * factor;
      }
    }
    return (cal: cal, pro: pro, carb: carb, fat: fat);
  }

  @override
  Widget build(BuildContext context) {
    final gc = context.gc;
    final eaten = _getEatenNutrition();
    final profile = fit.profile;

    // Dynamic targets calculated from user profile
    final targetCal = profile.targetCalories;
    final targetPro = profile.targetProtein;
    final targetCarb = profile.targetCarbs;
    final targetFat = profile.targetFat;
    final targetWaterMl = (profile.targetWaterLiters * 1000).round();
    final waterCurrent = _waterByDay[_selectedDay] ?? 0;

    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        clipBehavior: Clip.none,
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 116),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ScreenHeader(
              title: t.vietnameseMealsTitle,
              onBack: fit.handleBack,
              titleSize: 22,
              subtitle: '${profile.weightKg.round()}kg · ${profile.heightCm.round()}cm · Mục tiêu: ${_goalLabel(profile.fitnessGoal)}',
            ),
            const SizedBox(height: 14),

            // Bộ chuyển đổi mục tiêu thể hình (Bulk / Cut / Maintain)
            _goalSelectorCard(gc, profile),
            const SizedBox(height: 16),

            // Bộ chọn Thứ trong tuần
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: _days.map((d) {
                  final isSel = _selectedDay == d;
                  return GestureDetector(
                    onTap: () {
                      HapticFeedback.selectionClick();
                      setState(() => _selectedDay = d);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSel ? gc.accent : gc.bgRaised,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: isSel ? gc.accent : gc.border,
                        ),
                      ),
                      child: Text(
                        d,
                        style: AppTheme.f(
                          12.5,
                          weight: FontWeight.w700,
                          color: isSel ? Colors.white : gc.textSecondary,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 18),

            // Thẻ tổng kết dinh dưỡng ngày & Macros
            _nutritionSummaryCard(
              gc,
              eaten,
              targetCal,
              targetPro,
              targetCarb,
              targetFat,
            ),
            const SizedBox(height: 16),

            // Bộ theo dõi lượng nước uống (Water Tracker)
            _waterTrackerCard(gc, waterCurrent, targetWaterMl),
            const SizedBox(height: 22),

            // Thanh tìm kiếm món ăn & Bộ lọc danh mục
            _searchAndFilterBar(gc),
            const SizedBox(height: 18),

            // Danh sách các món ăn thể hình
            ..._buildMealSections(gc),
          ],
        ),
      ),
    );
  }

  String _goalLabel(String goal) {
    switch (goal) {
      case 'cut':
        return 'Giảm mỡ nét cơ';
      case 'maintain':
        return 'Duy trì vóc dáng';
      case 'bulk':
      default:
        return 'Tăng cơ nạc (Lean Bulk)';
    }
  }

  Widget _goalSelectorCard(GymColors gc, Profile profile) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: gc.bgRaised,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: gc.border),
      ),
      child: Row(
        children: [
          _goalButton(gc, profile, 'bulk', '🚀 Tăng cơ', '+350 kcal'),
          _goalButton(gc, profile, 'maintain', '⚖️ Duy trì', 'Chuẩn TDEE'),
          _goalButton(gc, profile, 'cut', '🔥 Siết cơ', '-450 kcal'),
        ],
      ),
    );
  }

  Widget _goalButton(
    GymColors gc,
    Profile profile,
    String key,
    String label,
    String sub,
  ) {
    final isSel = profile.fitnessGoal == key;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          HapticFeedback.selectionClick();
          setState(() {
            profile.fitnessGoal = key;
          });
          fit.persistNow();
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isSel ? gc.accent : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Text(
                label,
                style: AppTheme.f(
                  12,
                  weight: FontWeight.w800,
                  color: isSel ? Colors.white : gc.text,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                sub,
                style: AppTheme.s(
                  9.5,
                  weight: FontWeight.w600,
                  color: isSel ? Colors.white.withValues(alpha: 0.9) : gc.textTertiary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _nutritionSummaryCard(
    GymColors gc,
    ({int cal, double pro, double carb, double fat}) eaten,
    int targetCal,
    int targetPro,
    int targetCarb,
    int targetFat,
  ) {
    final pct = (targetCal > 0 ? eaten.cal / targetCal : 0.0).clamp(0.0, 1.0);
    final proPct = (targetPro > 0 ? eaten.pro / targetPro : 0.0).clamp(0.0, 1.0);
    final carbPct = (targetCarb > 0 ? eaten.carb / targetCarb : 0.0).clamp(0.0, 1.0);
    final fatPct = (targetFat > 0 ? eaten.fat / targetFat : 0.0).clamp(0.0, 1.0);

    return SoftCard(
      radius: 22,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [gc.accent, gc.brass],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shape: BoxShape.circle,
                ),
                child: const Icon(PhosphorIconsFill.chartPieSlice, color: Colors.white, size: 22),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'TỔNG KẾT: ${_selectedDay.toUpperCase()}',
                      style: AppTheme.f(10.5,
                          weight: FontWeight.w800, color: gc.accent, letterSpacing: 1.4),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${eaten.cal} / $targetCal kcal (${(pct * 100).round()}%)',
                      style: AppTheme.d(18, weight: FontWeight.w900, color: gc.text),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: pct,
              backgroundColor: gc.bgRaised2,
              valueColor: AlwaysStoppedAnimation(gc.accent),
              minHeight: 9,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _macroCol(gc, 'Protein', '${eaten.pro.round()}g', '/ ${targetPro}g', proPct, Colors.blue.shade400),
              const SizedBox(width: 8),
              _macroCol(gc, 'Carbs', '${eaten.carb.round()}g', '/ ${targetCarb}g', carbPct, gc.accent),
              const SizedBox(width: 8),
              _macroCol(gc, 'Fat', '${eaten.fat.round()}g', '/ ${targetFat}g', fatPct, gc.brass),
            ],
          ),
        ],
      ),
    );
  }

  Widget _macroCol(GymColors gc, String title, String val, String sub, double pct, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: gc.bgRaised2.withValues(alpha: 0.6),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: gc.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppTheme.s(10, weight: FontWeight.w700, color: gc.textTertiary)),
            const SizedBox(height: 2),
            Text(val, style: AppTheme.f(15, weight: FontWeight.w900, color: color)),
            Text(sub, style: AppTheme.s(9.5, weight: FontWeight.w500, color: gc.textSecondary)),
            const SizedBox(height: 6),
            ClipRRect(
              borderRadius: BorderRadius.circular(3),
              child: LinearProgressIndicator(
                value: pct,
                backgroundColor: gc.bgRaised,
                valueColor: AlwaysStoppedAnimation(color),
                minHeight: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _waterTrackerCard(GymColors gc, int currentMl, int targetMl) {
    final pct = (targetMl > 0 ? currentMl / targetMl : 0.0).clamp(0.0, 1.0);

    return SoftCard(
      radius: 20,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.blue.shade500.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(PhosphorIconsFill.drop, color: Colors.blue.shade400, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('NƯỚC UỐNG MỤC TIÊU',
                        style: AppTheme.f(10.5,
                            weight: FontWeight.w800, color: Colors.blue.shade400, letterSpacing: 1.2)),
                    const SizedBox(height: 2),
                    Text(
                      '$currentMl / $targetMl ml (${(pct * 100).round()}%)',
                      style: AppTheme.f(15, weight: FontWeight.w800, color: gc.text),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(PhosphorIconsRegular.arrowCounterClockwise, size: 18, color: gc.textTertiary),
                tooltip: 'Đặt lại nước hôm nay',
                onPressed: _resetWater,
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: LinearProgressIndicator(
              value: pct,
              backgroundColor: gc.bgRaised2,
              valueColor: AlwaysStoppedAnimation(Colors.blue.shade400),
              minHeight: 7,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  icon: const Icon(PhosphorIconsBold.plus, size: 14),
                  label: const Text('+250 ml'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.blue.shade400,
                    side: BorderSide(color: Colors.blue.shade400.withValues(alpha: 0.4)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  onPressed: () => _addWater(250),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: OutlinedButton.icon(
                  icon: const Icon(PhosphorIconsBold.plus, size: 14),
                  label: const Text('+500 ml'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.blue.shade400,
                    side: BorderSide(color: Colors.blue.shade400.withValues(alpha: 0.4)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  onPressed: () => _addWater(500),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _searchAndFilterBar(GymColors gc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Ô tìm kiếm món ăn
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: gc.bgRaised,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: gc.border),
          ),
          child: Row(
            children: [
              Icon(PhosphorIconsRegular.magnifyingGlass, color: gc.textTertiary, size: 18),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: _searchController,
                  onChanged: (val) {
                    setState(() {
                      _searchQuery = val.trim();
                    });
                  },
                  style: AppTheme.f(13.5, weight: FontWeight.w600, color: gc.text),
                  decoration: InputDecoration(
                    hintText: 'Tìm kiếm món ăn (phở, bò, gà, yến mạch, tôm, cá...)',
                    hintStyle: AppTheme.s(12, color: gc.textTertiary),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
              if (_searchQuery.isNotEmpty)
                GestureDetector(
                  onTap: () {
                    _searchController.clear();
                    setState(() {
                      _searchQuery = '';
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Icon(PhosphorIconsRegular.x, size: 15, color: gc.textTertiary),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 12),

        // Thanh cuộn chọn nhóm món ăn
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: _categoryTabs.map((tab) {
              final isSel = _selectedCategory == tab.$1;
              final count = tab.$1 == 'all'
                  ? kVietnameseMeals.length
                  : getVietnameseMealsByCategory(tab.$1).length;

              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: GestureDetector(
                  onTap: () {
                    HapticFeedback.selectionClick();
                    setState(() {
                      _selectedCategory = tab.$1;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                    decoration: BoxDecoration(
                      color: isSel ? gc.accent : gc.bgRaised,
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: isSel ? gc.accent : gc.border,
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(tab.$3, style: const TextStyle(fontSize: 12)),
                        const SizedBox(width: 6),
                        Text(
                          '${tab.$2} ($count)',
                          style: AppTheme.f(
                            11.5,
                            weight: isSel ? FontWeight.w800 : FontWeight.w600,
                            color: isSel ? Colors.white : gc.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildMealSections(GymColors gc) {
    if (_searchQuery.isNotEmpty) {
      // Tìm kiếm theo từ khóa
      var matches = searchVietnameseMeals(_searchQuery);
      if (_selectedCategory != 'all') {
        matches = matches.where((m) => m.category == _selectedCategory).toList();
      }

      if (matches.isEmpty) {
        return [
          SoftCard(
            radius: 20,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
            child: Column(
              children: [
                Icon(PhosphorIconsRegular.magnifyingGlass, size: 36, color: gc.textTertiary),
                const SizedBox(height: 12),
                Text(
                  'Không tìm thấy món nào với "$_searchQuery"',
                  style: AppTheme.f(14, weight: FontWeight.w700, color: gc.text),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 6),
                Text(
                  'Hãy thử từ khóa ngắn hơn như "gà", "bò", "cơm", "trứng", "cá"...',
                  style: AppTheme.s(12, color: gc.textTertiary),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ];
      }

      return [
        SoftCard(
          radius: 20,
          padding: EdgeInsets.zero,
          clip: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 16, 18, 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Kết quả tìm kiếm cho "$_searchQuery"',
                        style: AppTheme.f(14.5, weight: FontWeight.w800, color: gc.text),
                      ),
                    ),
                    Text(
                      '${matches.length} món',
                      style: AppTheme.s(12, weight: FontWeight.w700, color: gc.accent),
                    ),
                  ],
                ),
              ),
              Divider(height: 1, color: gc.border.withValues(alpha: 0.6)),
              ...matches.map((opt) {
                final portion = _getPortion(opt.id);
                final isEaten = portion != null && portion > 0;
                return _mealRow(gc, opt, isEaten, portion ?? 1.0);
              }),
            ],
          ),
        ),
      ];
    }

    // Hiển thị theo danh mục được chọn
    final sections = <Widget>[];

    void addSection(String title, String cat) {
      if (_selectedCategory == 'all' || _selectedCategory == cat) {
        if (sections.isNotEmpty) {
          sections.add(const SizedBox(height: 16));
        }
        sections.add(_mealCategorySection(gc, title, cat));
      }
    }

    addSection('Bữa Trước Tập ⚡ (Pre-Workout)', 'pre_workout');
    addSection('Bữa Sau Tập 💪 (Post-Workout)', 'post_workout');
    addSection('Bữa Sáng ☀️ (Breakfast)', 'breakfast');
    addSection('Bữa Trưa 🍲 (Lunch)', 'lunch');
    addSection('Bữa Tối 🌙 (Dinner)', 'dinner');
    addSection('Bữa Phụ 🍌 (Snack & Whey)', 'snack');

    return sections;
  }

  Widget _mealCategorySection(GymColors gc, String title, String category) {
    final options = getVietnameseMealsByCategory(category);

    return SoftCard(
      radius: 20,
      padding: EdgeInsets.zero,
      clip: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 16, 18, 10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: AppTheme.f(14.5, weight: FontWeight.w800, color: gc.text),
                  ),
                ),
                Text(
                  '${options.length} món',
                  style: AppTheme.s(12, weight: FontWeight.w600, color: gc.accent),
                ),
              ],
            ),
          ),
          Divider(height: 1, color: gc.border.withValues(alpha: 0.6)),
          ...options.map((opt) {
            final portion = _getPortion(opt.id);
            final isEaten = portion != null && portion > 0;
            return _mealRow(gc, opt, isEaten, portion ?? 1.0);
          }),
        ],
      ),
    );
  }

  Widget _mealRow(
    GymColors gc,
    VietnameseMealOption opt,
    bool isEaten,
    double portion,
  ) {
    final scaled = opt.scale(portion);

    return Container(
      decoration: BoxDecoration(
        color: isEaten ? gc.accent.withValues(alpha: 0.08) : Colors.transparent,
        border: Border(bottom: BorderSide(color: gc.border.withValues(alpha: 0.5))),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () => _toggleMeal(opt.id, portion),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: isEaten ? gc.accent : gc.bgRaised2,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isEaten ? gc.accent : gc.border,
                        width: isEaten ? 0 : 2,
                      ),
                      boxShadow: isEaten
                          ? [
                              BoxShadow(
                                color: gc.accent.withValues(alpha: 0.45),
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              ),
                            ]
                          : null,
                    ),
                    child: isEaten
                        ? const Icon(Icons.check_rounded, color: Colors.white, size: 18)
                        : null,
                  ),
                  const SizedBox(width: 12),
                  Text(opt.icon, style: const TextStyle(fontSize: 22)),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          opt.name,
                          style: AppTheme.f(
                            14,
                            weight: FontWeight.w800,
                            color: isEaten ? gc.accent : gc.text,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          scaled.portion,
                          style: AppTheme.s(11, weight: FontWeight.w500, color: gc.textSecondary),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            Text('${scaled.calories} kcal',
                                style: AppTheme.f(11.5, weight: FontWeight.w700, color: gc.accent)),
                            const SizedBox(width: 6),
                            Text('•', style: TextStyle(color: gc.textTertiary, fontSize: 10)),
                            const SizedBox(width: 6),
                            Text('${scaled.protein.round()}g đạm',
                                style: AppTheme.s(11, weight: FontWeight.w600, color: Colors.blue.shade400)),
                            const SizedBox(width: 6),
                            Text('•', style: TextStyle(color: gc.textTertiary, fontSize: 10)),
                            const SizedBox(width: 6),
                            Text('${scaled.carbs.round()}g carb',
                                style: AppTheme.s(11, weight: FontWeight.w500, color: gc.textSecondary)),
                          ],
                        ),
                        if (opt.note != null && opt.note!.isNotEmpty) ...[
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                            decoration: BoxDecoration(
                              color: gc.accent.withValues(alpha: 0.09),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              '💡 ${opt.note!}',
                              style: AppTheme.s(10, weight: FontWeight.w600, color: gc.accent),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bộ chọn nhanh khẩu phần (0.5x, 1.0x, 1.5x, 2.0x) khi món ăn đã được chọn
          if (isEaten)
            Padding(
              padding: const EdgeInsets.fromLTRB(56, 0, 16, 10),
              child: Row(
                children: [
                  Text('Khẩu phần: ',
                      style: AppTheme.s(11, weight: FontWeight.w600, color: gc.textTertiary)),
                  const SizedBox(width: 6),
                  _portionChip(gc, opt.id, 0.5, portion),
                  const SizedBox(width: 6),
                  _portionChip(gc, opt.id, 1.0, portion),
                  const SizedBox(width: 6),
                  _portionChip(gc, opt.id, 1.5, portion),
                  const SizedBox(width: 6),
                  _portionChip(gc, opt.id, 2.0, portion),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _portionChip(GymColors gc, String mealId, double factor, double currentFactor) {
    final isSel = currentFactor == factor;
    return GestureDetector(
      onTap: () => _setPortion(mealId, factor),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
          color: isSel ? gc.accent : gc.bgRaised2,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: isSel ? gc.accent : gc.border,
          ),
        ),
        child: Text(
          'x$factor',
          style: AppTheme.f(
            10.5,
            weight: FontWeight.w800,
            color: isSel ? Colors.white : gc.textSecondary,
          ),
        ),
      ),
    );
  }
}
