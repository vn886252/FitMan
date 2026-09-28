import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

import '../catalog/exercise_catalog.dart';
import '../l10n/l10n.dart';
import '../state/fit_state.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../widgets/app_background.dart';
import '../widgets/body_rulers.dart';
import '../widgets/entrance.dart';
import '../widgets/ui_kit.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _page = PageController();
  late final TextEditingController _name = TextEditingController();
  int _index = 0;
  static const _last = 5;
  final Map<String, Set<String>> _places = {};

  @override
  void dispose() {
    _page.dispose();
    _name.dispose();
    super.dispose();
  }

  void _go(int i) {
    _page.animateToPage(i, duration: const Duration(milliseconds: 340), curve: Curves.easeOutCubic);
  }

  void _onPage(int i) => setState(() => _index = i);

  void _finish() {
    final typed = _name.text.trim();
    if (typed.isNotEmpty) fit.updateProfile(name: typed);
    String? first;
    for (final preset in kPlacePresets) {
      final gear = _places[preset];
      if (gear == null) continue;
      final id = fit.addPlace(t.placePresetName(preset), equipment: {...gear, 'Bodyweight'});
      if (id.isNotEmpty) first ??= id;
    }
    if (first != null && fit.activePlaceId != first) fit.setActivePlace(first);
    fit.completeOnboarding();
  }

  Widget _in(int order, Widget child) => Rise(index: order, child: child);

  @override
  Widget build(BuildContext context) {
    final gc = context.gc;
    return Scaffold(
      backgroundColor: gc.bg,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(child: _Glow(gc)),
          const Positioned.fill(child: AppBackground(pattern: 'dots')),
          SafeArea(
            child: Column(
              children: [
                _topBar(gc),
                Expanded(
                  child: PageView(
                    controller: _page,
                    onPageChanged: _onPage,
                    children: [
                      _welcome(gc),
                      _nameStep(gc),
                      _bodyStep(gc),
                      _experienceStep(gc),
                      _goalStep(gc),
                      _placeStep(gc),
                    ],
                  ),
                ),
                _bottomBar(gc),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _topBar(GymColors gc) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 16, 0),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                for (int i = 0; i <= _last; i++)
                  Expanded(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 280),
                      curve: Curves.easeOutCubic,
                      margin: const EdgeInsets.only(right: 6),
                      height: 3,
                      decoration: BoxDecoration(
                        color: i <= _index ? gc.text : gc.bgRaised2,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: _finish,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Text(t.skip2,
                  style: AppTheme.f(12.5, weight: FontWeight.w600, color: gc.textTertiary)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomBar(GymColors gc) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 22),
      child: Row(
        children: [
          if (_index > 0)
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => _go(_index - 1),
              child: Container(
                width: 56,
                height: 56,
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(color: gc.bgRaised, shape: BoxShape.circle),
                child: Icon(PhosphorIconsBold.arrowLeft, size: 18, color: gc.textSecondary),
              ),
            ),
          Expanded(
            child: PrimaryButton(
              label: _index == _last ? t.welcomeStart : t.next,
              onTap: () => _index == _last ? _finish() : _go(_index + 1),
            ),
          ),
        ],
      ),
    );
  }

  Widget _step(
    GymColors gc, {
    required int step,
    required String title,
    required String why,
    required Widget child,
  }) {
    return LayoutBuilder(
      builder: (context, box) => SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: box.maxHeight - 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _in(0, Padding(padding: const EdgeInsets.only(left: 4), child: _label(gc, t.onbStep(step, _last)))),
              const SizedBox(height: 10),
              _in(
                1,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text(title,
                      style: AppTheme.f(30, weight: FontWeight.w800, color: gc.text, height: 1.12)),
                ),
              ),
              const SizedBox(height: 10),
              _in(
                2,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text(why,
                      style: AppTheme.f(13.5, weight: FontWeight.w500, color: gc.textSecondary, height: 1.45)),
                ),
              ),
              const SizedBox(height: 26),
              _in(3, child),
            ],
          ),
        ),
      ),
    );
  }

  Widget _label(GymColors gc, String text) => Text(text.toUpperCase(),
      style: AppTheme.f(10.5, weight: FontWeight.w700, color: gc.textTertiary, letterSpacing: 1.3));

  Widget _group(GymColors gc, List<Widget> rows) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(color: gc.bgRaised, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          for (var i = 0; i < rows.length; i++) ...[
            if (i > 0)
              Divider(height: 1, thickness: 1, indent: 16, endIndent: 16, color: gc.border.withValues(alpha: 0.6)),
            rows[i],
          ],
        ],
      ),
    );
  }

  Widget _rowIcon(GymColors gc, IconData icon, {Color? color}) => Padding(
        padding: const EdgeInsets.only(right: 14),
        child: SizedBox(width: 22, child: Icon(icon, size: 19, color: color ?? gc.textSecondary)),
      );

  Widget _welcome(GymColors gc) {
    return LayoutBuilder(
      builder: (context, box) => SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: box.maxHeight - 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _in(
                0,
                Center(
                  child: Image.asset('assets/img/runner.png',
                      height: 196, opacity: const AlwaysStoppedAnimation(0.9)),
                ),
              ),
              const SizedBox(height: 26),
              _in(
                1,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text(t.welcomeKicker.toUpperCase(),
                      style: AppTheme.f(10.5, weight: FontWeight.w700, color: gc.textTertiary, letterSpacing: 1.6)),
                ),
              ),
              const SizedBox(height: 8),
              _in(
                2,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text('FitMan',
                      style: AppTheme.f(44, weight: FontWeight.w800, color: gc.text, height: 1)),
                ),
              ),
              const SizedBox(height: 12),
              _in(
                3,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text(t.welcomeBlurb,
                      style: AppTheme.f(14.5, weight: FontWeight.w500, color: gc.textSecondary, height: 1.5)),
                ),
              ),
              const SizedBox(height: 22),
              _in(
                4,
                _group(gc, [
                  _promise(gc, PhosphorIconsRegular.gift, t.freeForever, t.freeForeverWhy),
                  _promise(gc, PhosphorIconsRegular.wifiSlash, t.fullyOffline, t.fullyOfflineWhy),
                  _promise(gc, PhosphorIconsRegular.export, t.yoursToTake, t.yoursToTakeWhy),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _promise(GymColors gc, IconData icon, String title, String why) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: const EdgeInsets.only(top: 1), child: _rowIcon(gc, icon)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTheme.f(14.5, weight: FontWeight.w600, color: gc.text)),
                  const SizedBox(height: 3),
                  Text(why,
                      style: AppTheme.f(12.5, weight: FontWeight.w500, color: gc.textSecondary, height: 1.4)),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _nameStep(GymColors gc) {
    return _step(
      gc,
      step: 1,
      title: t.onbNameTitle,
      why: t.onbNameWhy,
      child: _group(gc, [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 8),
          child: Row(
            children: [
              _rowIcon(gc, PhosphorIconsRegular.userCircle),
              Expanded(
                child: TextField(
                  controller: _name,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.done,
                  style: AppTheme.f(17, weight: FontWeight.w700, color: gc.text),
                  cursorColor: gc.accent,
                  onSubmitted: (_) => _go(2),
                  decoration: InputDecoration(
                    hintText: t.onbNameHint,
                    hintStyle: AppTheme.f(17, weight: FontWeight.w600, color: gc.textTertiary),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  Widget _bodyStep(GymColors gc) {
    final p = fit.profile;
    return _step(
      gc,
      step: 2,
      title: t.onbBodyTitle,
      why: t.onbBodyWhy,
      child: _group(gc, [
        _bodyRow(
          gc,
          PhosphorIconsRegular.genderIntersex,
          t.sexLabel,
          SegToggle([
            SegOption(t.male, p.sex == 'male', () => _up(() => fit.updateProfile(sex: 'male'))),
            SegOption(t.female, p.sex == 'female', () => _up(() => fit.updateProfile(sex: 'female'))),
          ]),
        ),
        _valueRow(gc, PhosphorIconsRegular.cake, t.ageLabel, '${p.age}', editAge),
        _valueRow(gc, PhosphorIconsRegular.ruler, t.heightLabel, fit.heightLabel(p.heightCm), editHeight),
        _valueRow(gc, PhosphorIconsRegular.scales, t.weightLabel, fit.weightLabel(p.weightKg), editBodyWeight),
      ]),
    );
  }

  Widget _bodyRow(GymColors gc, IconData icon, String label, Widget control) => ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 58),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              _rowIcon(gc, icon),
              Expanded(
                child: Text(sentenceCase(label),
                    style: AppTheme.f(14.5, weight: FontWeight.w500, color: gc.text)),
              ),
              const SizedBox(width: 12),
              control,
            ],
          ),
        ),
      );

  Widget _valueRow(GymColors gc, IconData icon, String label, String value,
      Future<void> Function(BuildContext) edit) {
    return Semantics(
      button: true,
      label: sentenceCase(label),
      value: value,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => edit(context).then((_) => _up(() {})),
        child: _bodyRow(
          gc,
          icon,
          label,
          Row(mainAxisSize: MainAxisSize.min, children: [
            Text(value, style: AppTheme.f(15.5, weight: FontWeight.w700, color: gc.text)),
            const SizedBox(width: 8),
            Icon(PhosphorIconsBold.caretRight, size: 13, color: gc.textTertiary),
          ]),
        ),
      ),
    );
  }

  Widget _experienceStep(GymColors gc) {
    final p = fit.profile;
    final expTitle = '${"Kinh nghiệm tập luyện"}';
    final expWhy = '${"FitMan sẽ sắp xếp bài tập và mức tạ vừa sức, an toàn nhất cho bạn."}';

    return _step(
      gc,
      step: 3,
      title: expTitle,
      why: expWhy,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _expOptionCard(
            gc,
            key: 'beginner',
            icon: '🌱',
            title: '${"Người mới bắt đầu"}',
            badge: '${"< 6 tháng"}',
            desc: '${"Chưa có kinh nghiệm gym. Ưu tiên máy tập (Machine) và tạ đơn dễ tập, an toàn cột sống & khớp."}',
            isSel: p.isBeginner,
          ),
          const SizedBox(height: 12),
          _expOptionCard(
            gc,
            key: 'intermediate',
            icon: '⚡',
            title: '${"Đã có kinh nghiệm"}',
            badge: '${"6 tháng - 2 năm"}',
            desc: '${"Nắm vững kỹ thuật cơ bản. Phối hợp tạ đòn (Barbell), tạ đơn & cáp để tăng cơ bắp toàn diện."}',
            isSel: p.isIntermediate,
          ),
          const SizedBox(height: 12),
          _expOptionCard(
            gc,
            key: 'advanced',
            icon: '🏆',
            title: '${"Chuyên nghiệp / Nâng cao"}',
            badge: '${"2+ năm"}',
            desc: '${"Thành thạo kỹ thuật tạ nặng compound. Cần phân kỳ chu kỳ (Periodization), volume & RPE cao."}',
            isSel: p.isAdvanced,
          ),
        ],
      ),
    );
  }

  Widget _expOptionCard(
    GymColors gc, {
    required String key,
    required String icon,
    required String title,
    required String badge,
    required String desc,
    required bool isSel,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        HapticFeedback.selectionClick();
        _up(() => fit.updateProfile(experienceLevel: key));
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSel ? gc.ember.withValues(alpha: 0.12) : gc.bgRaised,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isSel ? gc.ember : gc.border,
            width: isSel ? 1.8 : 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: isSel ? gc.ember : gc.bgRaised2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(child: Text('${icon}', style: const TextStyle(fontSize: 22))),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '${title}',
                          style: AppTheme.f(
                            15,
                            weight: FontWeight.w800,
                            color: isSel ? gc.ember : gc.text,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2.5),
                        decoration: BoxDecoration(
                          color: isSel ? gc.ember : gc.bgRaised2,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          '${badge}',
                          style: AppTheme.f(
                            10.5,
                            weight: FontWeight.w700,
                            color: isSel ? gc.onEmber : gc.textSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${desc}',
                    style: AppTheme.s(
                      12,
                      weight: FontWeight.w500,
                      color: isSel ? gc.text : gc.textSecondary,
                      height: 1.35,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _goalStep(GymColors gc) {
    final goal = fit.profile.weeklyGoal;
    return _step(
      gc,
      step: 4,
      title: t.onbGoalTitle,
      why: t.onbGoalWhy,
      child: Container(
        padding: const EdgeInsets.fromLTRB(18, 20, 18, 20),
        decoration: BoxDecoration(color: gc.bgRaised, borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _label(gc, t.weeklyGoal),
            const SizedBox(height: 8),
            Text(t.perWeek(goal), style: AppTheme.f(22, weight: FontWeight.w800, color: gc.text)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (var n = 1; n <= 7; n++)
                  Semantics(
                    button: true,
                    selected: n == goal,
                    label: t.perWeek(n),
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => _up(() => fit.updateProfile(weeklyGoalDelta: n - goal)),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 220),
                        curve: Curves.easeOutCubic,
                        width: 36,
                        height: 36,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: n <= goal ? gc.ember : gc.bgRaised2,
                          shape: BoxShape.circle,
                        ),
                        child: Text('$n',
                            style: AppTheme.f(13.5,
                                weight: FontWeight.w800, color: n <= goal ? gc.onEmber : gc.textTertiary)),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static const _placeIcons = {
    'gym': PhosphorIconsRegular.barbell,
    'home': PhosphorIconsRegular.house,
    'outdoors': PhosphorIconsRegular.tree,
  };

  Widget _placeStep(GymColors gc) {
    return _step(
      gc,
      step: 5,
      title: t.onbPlaceTitle,
      why: t.onbPlaceWhy,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _group(gc, [for (final preset in kPlacePresets) _placeRow(gc, preset)]),
          AnimatedSize(
            duration: const Duration(milliseconds: 260),
            curve: Curves.easeOutCubic,
            alignment: Alignment.topCenter,
            child: _places.isEmpty
                ? const SizedBox(width: double.infinity)
                : Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (final preset in kPlacePresets)
                          if (_places[preset] case final gear?) ...[
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: _label(
                                  gc,
                                  _places.length > 1
                                      ? '${t.placePresetName(preset)} · ${t.onbPlaceGear}'
                                      : t.onbPlaceGear),
                            ),
                            const SizedBox(height: 10),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                for (final e in kFilterEquipment)
                                  if (e != 'Bodyweight')
                                    Pill(
                                      label: t.equipment(e),
                                      bg: gear.contains(e) ? gc.ember : gc.bgRaised,
                                      fg: gear.contains(e) ? gc.onEmber : gc.textSecondary,
                                      onTap: () => setState(() {
                                        if (!gear.remove(e)) gear.add(e);
                                      }),
                                      hPad: 14,
                                      vPad: 8,
                                      fontSize: 12.5,
                                    ),
                              ],
                            ),
                            const SizedBox(height: 18),
                          ],
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _placeRow(GymColors gc, String preset) {
    final on = _places.containsKey(preset);
    final gear = {...?(_places[preset] ?? kPlacePresetGear[preset]), 'Bodyweight'};
    final n = fit.allExercises.where((e) => gear.contains(e.equipment)).length;
    return Semantics(
      button: true,
      selected: on,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => setState(() {
          if (_places.remove(preset) == null) {
            _places[preset] = {...?kPlacePresetGear[preset]}..remove('Bodyweight');
          }
        }),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              _rowIcon(gc, _placeIcons[preset]!, color: on ? gc.ember : null),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(t.placePresetName(preset),
                        style: AppTheme.f(14.5,
                            weight: on ? FontWeight.w800 : FontWeight.w600, color: on ? gc.ember : gc.text)),
                    const SizedBox(height: 2),
                    Text(t.exerciseCount(n),
                        style: AppTheme.f(12, weight: FontWeight.w500, color: gc.textSecondary)),
                  ],
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: on ? 1 : 0,
                child: Icon(PhosphorIconsFill.checkCircle, size: 18, color: gc.ember),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _up(VoidCallback action) {
    action();
    setState(() {});
  }
}

class _Glow extends StatelessWidget {
  const _Glow(this.gc);

  final GymColors gc;

  @override
  Widget build(BuildContext context) => IgnorePointer(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: const Alignment(0.9, -0.85),
              radius: 1.1,
              colors: [gc.ember.withValues(alpha: 0.12), gc.bg.withValues(alpha: 0)],
            ),
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: const Alignment(-0.9, 0.9),
                radius: 1.0,
                colors: [gc.brass.withValues(alpha: 0.07), gc.bg.withValues(alpha: 0)],
              ),
            ),
            child: const SizedBox.expand(),
          ),
        ),
      );
}
