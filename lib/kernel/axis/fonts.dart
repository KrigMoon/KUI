import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kui/kernel/axis/geometry.dart';

enum KDFontStyle { h1, h2, h3, p, control }

class KDFonts {
  static TextStyle base = GoogleFonts.nunito();

  static TextStyle font(KDFontStyle style) => switch (style) {
    KDFontStyle.h1 => base.copyWith(
      fontSize: KDGeometry.base * 6,
      fontWeight: FontWeight.w700,
    ),
    KDFontStyle.h2 => base.copyWith(
      fontSize: KDGeometry.base * 5,
      fontWeight: FontWeight.w600,
    ),
    KDFontStyle.h3 => base.copyWith(
      fontSize: KDGeometry.base * 4,
      fontWeight: FontWeight.w500,
    ),
    KDFontStyle.p => base.copyWith(
      fontSize: KDGeometry.base * 3,
      fontWeight: FontWeight.w500,
    ),
    KDFontStyle.control => base.copyWith(
      fontSize: KDGeometry.base * 3,
      fontWeight: FontWeight.w600,
    ),
  };

  static double icon(KDFontStyle style) => switch (style) {
    KDFontStyle.h1 => KDGeometry.base * 6.5,
    KDFontStyle.h2 => KDGeometry.base * 5.5,
    KDFontStyle.h3 => KDGeometry.base * 4.5,
    KDFontStyle.p => KDGeometry.base * 3.5,
    KDFontStyle.control => KDGeometry.base * 3.5,
  };
}
