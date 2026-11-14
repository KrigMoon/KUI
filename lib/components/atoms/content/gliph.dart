import 'package:flutter/material.dart';
import 'package:kui/kui.dart';
import 'package:provider/provider.dart';

enum KDGliphVariant { normal, accent, onAccent }

class KUIText extends StatelessWidget {
  final String label;
  final KDFontStyle style;
  final KDGliphVariant variant;
  final Color? foreground;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  const KUIText({
    super.key,
    required this.label,
    required this.style,
    this.variant = KDGliphVariant.normal,
    this.foreground,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  Color getForeground(BuildContext context) {
    final colors = context.watch<KDColors>();
    Color fg = colors.foreground;
    switch (variant) {
      case KDGliphVariant.accent:
        fg = colors.accent;
      case KDGliphVariant.onAccent:
        fg = colors.onAccent;
      default:
        fg = colors.fgStyle(style, fg);
    }

    return fg;
  }

  @override
  Widget build(BuildContext context) {
    final fg = foreground ?? getForeground(context);
    return Text(
      label,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines ?? (style == KDFontStyle.p ? 3 : 1),
      overflow: overflow ?? TextOverflow.ellipsis,
      style: KDFonts.font(style).copyWith(color: fg),
    );
  }
}

class KUIIcon extends StatelessWidget {
  final IconData icon;
  final KDFontStyle style;
  final KDGliphVariant variant;
  final Color? foreground;
  final double? size;
  const KUIIcon({
    super.key,
    required this.icon,
    required this.style,
    this.variant = KDGliphVariant.normal,
    this.foreground,
    this.size,
  });

  Color getForeground(BuildContext context) {
    final colors = context.watch<KDColors>();
    Color fg = colors.foreground;
    switch (variant) {
      case KDGliphVariant.accent:
        fg = colors.accent;
      case KDGliphVariant.onAccent:
        fg = colors.onAccent;
      default:
        fg = colors.fgStyle(style, fg);
    }

    return fg;
  }

  @override
  Widget build(BuildContext context) {
    final fg = foreground ?? getForeground(context);
    return Icon(icon, size: size ?? KDFonts.icon(style), color: fg);
  }
}
