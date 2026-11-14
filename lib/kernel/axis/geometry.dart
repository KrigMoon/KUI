class KDGeometry {
  static const double base = 4.0;

  // padding, spacing, indent
  static const double baseLSpacing = base * 3; // 12
  static const double baseMSpacing = base * 2; // 8
  static const double baseSSpacing = base; // 4

  // radius
  static const double baseLRadius = base * 7; // 28
  static const double baseMRadius = baseLRadius - baseMSpacing; // 20
  static const double baseSRadius = baseMRadius - baseMSpacing; // 12

  // sizes
  static const double headerL = base * 14; // 56
  static const double header = base * 10; // 40
  static const double control = base * 8; // 32
}
