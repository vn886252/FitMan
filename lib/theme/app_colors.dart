import 'package:flutter/material.dart';

@immutable
class GymColors extends ThemeExtension<GymColors> {
  const GymColors({
    required this.pageBg,
    required this.bg,
    required this.bgRaised,
    required this.bgRaised2,
    required this.border,
    required this.navBg,
    required this.text,
    required this.textSecondary,
    required this.textTertiary,
    required this.ember,
    required this.emberDeep,
    required this.onEmber,
    required this.emberSoft,
    required this.emberShadow,
    required this.accent,
    required this.accentSoft,
    required this.brass,
    required this.sage,
    required this.sageSoft,
    required this.mutedFill,
    required this.heatEmpty,
    required this.info,
    required this.warn,
    required this.danger,
  });

  final Color pageBg;
  final Color bg;
  final Color bgRaised;
  final Color bgRaised2;
  final Color border;
  final Color navBg;
  final Color text;
  final Color textSecondary;
  final Color textTertiary;
  final Color ember;
  final Color emberDeep;
  final Color onEmber;
  final Color emberSoft;
  final Color emberShadow;
  final Color accent;
  final Color accentSoft;
  final Color brass;
  final Color sage;
  final Color sageSoft;
  final Color mutedFill;
  final Color heatEmpty;
  final Color info;
  final Color warn;
  final Color danger;

  static const brandOrange = Color(0xFFF47E1D);
  static const brandOrangeDeep = Color(0xFFD6670E);

  static const dark = GymColors(
    pageBg: Color(0xFF0C0B0A),
    bg: Color(0xFF0F0E0D),
    bgRaised: Color(0xFF1C1A18),
    bgRaised2: Color(0xFF292623),
    border: Color(0xFF3B3631),
    navBg: Color(0xD90F0E0D),
    text: Color(0xFFFFFFFF),
    textSecondary: Color(0xFFA5A09B),
    textTertiary: Color(0xFF736D67),
    ember: brandOrange,
    emberDeep: brandOrangeDeep,
    onEmber: Color(0xFF0C0B0A),
    emberSoft: Color(0x33F47E1D),
    emberShadow: Color(0x59F47E1D),
    accent: brandOrange,
    accentSoft: Color(0x2EF47E1D),
    brass: Color(0xFFFFA052),
    sage: Color(0xFF8FA377),
    sageSoft: Color(0x298FA377),
    mutedFill: Color(0xFF282522),
    heatEmpty: Color(0xFF221F1D),
    info: Color(0xFF7FA8C9),
    warn: Color(0xFFE0B15A),
    danger: Color(0xFFE5674C),
  );

  /// Darkened accent variant for light mode contrast (≥ 4.5:1 on bone bg, > 7:1 with white).
  static const _lightAccent = Color(0xFF8C4400);

  static const light = GymColors(
    pageBg: Color(0xFFFFFFFF),
    bg: Color(0xFFFCF7F1),          // warmer bone (warmth > 6)
    bgRaised: Color(0xFFFFFFFF),
    bgRaised2: Color(0xFFF2ECE6),
    border: Color(0xFFE5DDD5),
    navBg: Color(0xF2FFFFFF),
    text: Color(0xFF1A1714),
    textSecondary: Color(0xFF635B54),
    textTertiary: Color(0xFF8F857D),
    ember: _lightAccent,
    emberDeep: Color(0xFF6B3500),
    onEmber: Color(0xFFFFFFFF),       // white on burnt orange → > 7:1
    emberSoft: Color(0x248C4400),
    emberShadow: Color(0x3D8C4400),
    accent: _lightAccent,
    accentSoft: Color(0x248C4400),
    brass: Color(0xFF8C4400),
    sage: Color(0xFF3D7A52),
    sageSoft: Color(0x1F3D7A52),
    mutedFill: Color(0xFFEDE7E1),
    heatEmpty: Color(0xFFE8E2DB),
    info: Color(0xFF3268A0),
    warn: Color(0xFF9A6A12),
    danger: Color(0xFFC0392B),
  );

  @override
  GymColors copyWith({
    Color? pageBg,
    Color? bg,
    Color? bgRaised,
    Color? bgRaised2,
    Color? border,
    Color? navBg,
    Color? text,
    Color? textSecondary,
    Color? textTertiary,
    Color? ember,
    Color? emberDeep,
    Color? onEmber,
    Color? emberSoft,
    Color? emberShadow,
    Color? accent,
    Color? accentSoft,
    Color? brass,
    Color? sage,
    Color? sageSoft,
    Color? mutedFill,
    Color? heatEmpty,
    Color? info,
    Color? warn,
    Color? danger,
  }) {
    return GymColors(
      pageBg: pageBg ?? this.pageBg,
      bg: bg ?? this.bg,
      bgRaised: bgRaised ?? this.bgRaised,
      bgRaised2: bgRaised2 ?? this.bgRaised2,
      border: border ?? this.border,
      navBg: navBg ?? this.navBg,
      text: text ?? this.text,
      textSecondary: textSecondary ?? this.textSecondary,
      textTertiary: textTertiary ?? this.textTertiary,
      ember: ember ?? this.ember,
      emberDeep: emberDeep ?? this.emberDeep,
      onEmber: onEmber ?? this.onEmber,
      emberSoft: emberSoft ?? this.emberSoft,
      emberShadow: emberShadow ?? this.emberShadow,
      accent: accent ?? this.accent,
      accentSoft: accentSoft ?? this.accentSoft,
      brass: brass ?? this.brass,
      sage: sage ?? this.sage,
      sageSoft: sageSoft ?? this.sageSoft,
      mutedFill: mutedFill ?? this.mutedFill,
      heatEmpty: heatEmpty ?? this.heatEmpty,
      info: info ?? this.info,
      warn: warn ?? this.warn,
      danger: danger ?? this.danger,
    );
  }

  @override
  GymColors lerp(GymColors? other, double t) {
    if (other == null) return this;
    Color c(Color a, Color b) => Color.lerp(a, b, t)!;
    return GymColors(
      pageBg: c(pageBg, other.pageBg),
      bg: c(bg, other.bg),
      bgRaised: c(bgRaised, other.bgRaised),
      bgRaised2: c(bgRaised2, other.bgRaised2),
      border: c(border, other.border),
      navBg: c(navBg, other.navBg),
      text: c(text, other.text),
      textSecondary: c(textSecondary, other.textSecondary),
      textTertiary: c(textTertiary, other.textTertiary),
      ember: c(ember, other.ember),
      emberDeep: c(emberDeep, other.emberDeep),
      onEmber: c(onEmber, other.onEmber),
      emberSoft: c(emberSoft, other.emberSoft),
      emberShadow: c(emberShadow, other.emberShadow),
      accent: c(accent, other.accent),
      accentSoft: c(accentSoft, other.accentSoft),
      brass: c(brass, other.brass),
      sage: c(sage, other.sage),
      sageSoft: c(sageSoft, other.sageSoft),
      mutedFill: c(mutedFill, other.mutedFill),
      heatEmpty: c(heatEmpty, other.heatEmpty),
      info: c(info, other.info),
      warn: c(warn, other.warn),
      danger: c(danger, other.danger),
    );
  }
}

extension GymColorsX on BuildContext {
  GymColors get gc => Theme.of(this).extension<GymColors>()!;
}
