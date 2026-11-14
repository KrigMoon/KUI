import 'package:flutter/material.dart';
import 'package:kui/kui.dart';

class LevelsDiff {
  final double lvl1;
  final double lvl2;
  final double lvl3;
  LevelsDiff({required this.lvl1, required this.lvl2, required this.lvl3});
}

class KDColorsScheme {
  final String name;
  final Color background;
  final Color surface;
  final Color foreground;
  final Color accent;
  final Color onAccent;
  final Color border;
  final Color ghost;
  final Brightness systemIcons;
  final LevelsDiff levelsL;

  KDColorsScheme({
    required this.name,
    required this.background,
    required this.systemIcons,
    required this.foreground,
    required this.levelsL,
    required this.accent,
    required this.onAccent,
    required this.border,
    required this.surface,
    required this.ghost,
  });

  factory KDColorsScheme.lightAmber() {
    return KDColorsScheme(
      name: "Светлая (Янтарная)",
      background: Color(0xFFFAF0E6),
      surface: Color(0xFFFAFAFA),
      ghost: Color(0x1F18181B),
      foreground: Color(0xFF18181B),
      accent: Color(0xFFFFAA55),
      onAccent: Color(0xFF18181B),
      border: Color(0xFFA0A0A0),
      systemIcons: Brightness.dark,
      levelsL: LevelsDiff(lvl1: -0.1, lvl2: -0.15, lvl3: -0.2),
    );
  }

  factory KDColorsScheme.lightOcean() {
    return KDColorsScheme(
      name: "Светлая (Море)",
      background: Color(0xFFFAF0E6),
      surface: Color(0xFFFAFAFA),
      ghost: Color(0x1F18181B),
      foreground: Color(0xFF18181B),
      accent: Color(0xFF0284C7),
      onAccent: Color(0xFFFFFFFF),
      border: Color(0xFFA0A0A0),
      systemIcons: Brightness.dark,
      levelsL: LevelsDiff(lvl1: -0.1, lvl2: -0.15, lvl3: -0.2),
    );
  }

  factory KDColorsScheme.lightRuby() {
    return KDColorsScheme(
      name: "Светлая (Рубиновая)",
      background: Color(0xFFFAF0E6),
      surface: Color(0xFFFAFAFA),
      ghost: Color(0x1F18181B),
      foreground: Color(0xFF18181B),
      accent: Color(0xFFE11D48),
      onAccent: Color(0xFFFFFFFF),
      border: Color(0xFFA0A0A0),
      systemIcons: Brightness.dark,
      levelsL: LevelsDiff(lvl1: -0.1, lvl2: -0.15, lvl3: -0.2),
    );
  }

  factory KDColorsScheme.darkAmber() {
    return KDColorsScheme(
      name: "Тёмная (Янтарная)",
      background: Color(0xFF0A0A0A),
      surface: Color(0xFF1C1C1F),
      ghost: Color(0x40808080),
      foreground: Color(0xFFE4E4E7),
      accent: Color(0xFFC66408),
      onAccent: Color(0xFF1C1400),
      border: Color(0xFF3A3A3A),
      systemIcons: Brightness.light,
      levelsL: LevelsDiff(lvl1: 0.1, lvl2: 0.15, lvl3: 0.2),
    );
  }

  factory KDColorsScheme.darkOcean() {
    return KDColorsScheme(
      name: "Тёмная (Океан)",
      background: Color(0xFF0A0A0A),
      surface: Color(0xFF1C1C1F),
      ghost: Color(0x40808080),
      foreground: Color(0xFFE4E4E7),
      accent: Color(0xFF38BDF8),
      onAccent: Color(0xFF082F49),
      border: Color(0xFF3A3A3A),
      systemIcons: Brightness.light,
      levelsL: LevelsDiff(lvl1: 0.055, lvl2: 0.115, lvl3: 0.17),
    );
  }

  factory KDColorsScheme.darkRuby() {
    return KDColorsScheme(
      name: "Тёмная (Рубиновая)",
      background: Color(0xFF0A0A0A),
      surface: Color(0xFF1C1C1F),
      ghost: Color(0x40808080),
      foreground: Color(0xFFE4E4E7),
      accent: Color(0xFFF43F5E),
      onAccent: Color(0xFF1C0008),
      border: Color(0xFF3A3A3A),
      systemIcons: Brightness.light,
      levelsL: LevelsDiff(lvl1: 0.055, lvl2: 0.115, lvl3: 0.17),
    );
  }
}

class KDColors extends ChangeNotifier {
  static final Map<String, KDColorsScheme> colors = {
    "lightAmber": KDColorsScheme.lightAmber(),
    "lightOcean": KDColorsScheme.lightOcean(),
    "lightRuby": KDColorsScheme.lightRuby(),
    "darkAmber": KDColorsScheme.darkAmber(),
    "darkOcean": KDColorsScheme.darkOcean(),
    "darkRuby": KDColorsScheme.darkRuby(),
  };

  String _current = "darkOcean";

  List<String> get colorsKeys => colors.keys.toList()..sort();

  String get current => _current;
  KDColorsScheme get scheme => colors[current] ?? colors["darkAmber"]!;
  String schemeName(String name) => colors[name]!.name;

  void change(String newScheme) {
    if (_current != newScheme) {
      _current = newScheme;
      notifyListeners();
    }
  }

  // --- Цветовые утилиты ---

  static Color translateL(Color color, double delta) {
    final hsl = HSLColor.fromColor(color);
    return hsl.withLightness((hsl.lightness + delta).clamp(0.0, 1.0)).toColor();
  }

  static Color translateLInverse(Color color, double delta) {
    return translateL(color, -delta);
  }

  static Color translateS(Color color, double delta) {
    final hsl = HSLColor.fromColor(color);
    final s = (hsl.saturation + delta).clamp(0.0, 1.0).toDouble();
    return hsl.withSaturation(s).toColor();
  }

  // --- Базовые цвета схемы ---

  Color get background => scheme.background;
  Color get surface => scheme.surface;
  Color get foreground => scheme.foreground;
  Color get accent => scheme.accent;
  Color get onAccent => scheme.onAccent;
  Color get border => scheme.border;
  Color get ghost => scheme.ghost;

  Brightness get systemIcons => scheme.systemIcons;
  LevelsDiff get levelsL => scheme.levelsL;

  // --- Производные фоны ---

  Color card(Color bg) => translateL(bg, levelsL.lvl1);
  Color control(Color bg) => translateL(bg, levelsL.lvl2);
  Color overlay(Color bg) => translateL(bg, levelsL.lvl3);

  Color hover(Color bg) => translateL(bg, levelsL.lvl1);
  Color press(Color bg) => translateL(bg, levelsL.lvl2);

  // --- Производный текст ---

  Color primary(Color fg) => fg;
  Color regular(Color fg) => translateLInverse(fg, levelsL.lvl1);
  Color secondary(Color fg) => translateLInverse(fg, levelsL.lvl2 * 2.5);

  Color fgStyle(KDFontStyle style, Color fg) => switch (style) {
    KDFontStyle.h1 => primary(fg),
    KDFontStyle.h2 => regular(fg),
    KDFontStyle.h3 => regular(fg),
    KDFontStyle.p => secondary(fg),
    KDFontStyle.control => regular(fg),
  };
}
