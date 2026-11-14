import 'package:flutter/material.dart';
import 'package:kui/kui.dart';
import 'package:provider/provider.dart';

enum KDButtonVariant { normal, accent, ghost, bordered }

class KUIButton extends StatelessWidget {
  final String? label;
  final IconData? icon;
  final VoidCallback? onPressed;
  final Color? background;
  final Color? hoverColor;
  final Color? pressColor;
  final Color? foreground;
  final KDButtonVariant variant;
  final double? radius;
  final BorderRadius? borderRadius;
  final double? width;
  final double? height;
  final KDFontStyle? gliphStyle;
  const KUIButton({
    super.key,
    this.label,
    this.onPressed,
    this.variant = KDButtonVariant.normal,
    this.background,
    this.hoverColor,
    this.pressColor,
    this.foreground,
    this.icon,
    this.radius,
    this.borderRadius,
    this.width,
    this.height,
    this.gliphStyle,
  });

  Color getBackground(BuildContext context) {
    final colors = context.watch<KDColors>();
    Color bg = colors.surface;
    switch (variant) {
      case KDButtonVariant.accent:
        bg = colors.accent;
      case KDButtonVariant.ghost:
      case KDButtonVariant.bordered:
        bg = Colors.transparent;
      default:
    }

    return colors.control(bg);
  }

  Color getHover(BuildContext context, Color bg) {
    final colors = context.watch<KDColors>();
    return colors.hover(colors.ghost);
  }

  Color getPress(BuildContext context, Color bg) {
    final colors = context.watch<KDColors>();
    return colors.press(colors.ghost);
  }

  Color getForeground(BuildContext context) {
    final colors = context.watch<KDColors>();
    Color fg = colors.foreground;
    switch (variant) {
      case KDButtonVariant.accent:
        fg = colors.onAccent;
      default:
        fg = onPressed == null ? colors.secondary(fg) : colors.primary(fg);
    }

    return fg;
  }

  BorderSide getBorderSide(BuildContext context) {
    final colors = context.watch<KDColors>();
    return BorderSide(color: colors.border);
  }

  @override
  Widget build(BuildContext context) {
    Color bg = background ?? getBackground(context);
    final hover = hoverColor ?? getHover(context, bg);
    final press = pressColor ?? getPress(context, bg);
    Color fg = foreground ?? getForeground(context);

    bg = onPressed == null ? KDColors.translateS(bg, -0.3) : bg;
    final btn = ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(bg),
        shadowColor: WidgetStatePropertyAll(Colors.transparent),
        elevation: WidgetStatePropertyAll(0),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(
            vertical: KDGeometry.baseMSpacing,
            horizontal: icon != null && label == null
                ? KDGeometry.baseMSpacing
                : KDGeometry.baseLSpacing * 2,
          ),
        ),
        minimumSize: WidgetStatePropertyAll(Size.zero),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        splashFactory: NoSplash.splashFactory,
        overlayColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.hovered)) return hover;
          if (states.contains(WidgetState.pressed)) return press;
          return Colors.transparent;
        }),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            side: variant == KDButtonVariant.bordered
                ? getBorderSide(context)
                : BorderSide.none,
            borderRadius:
                borderRadius ??
                BorderRadius.circular(radius ?? KDGeometry.baseMRadius),
          ),
        ),
      ),
      child: KUIAxisList(
        axis: Axis.horizontal,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null)
            KUIIcon(
              foreground: fg,
              icon: icon!,
              style: gliphStyle ?? KDFontStyle.control,
            ),
          if (label != null)
            Flexible(
              child: KUIText(
                textAlign: TextAlign.center,
                foreground: fg,
                label: label!,
                style: gliphStyle ?? KDFontStyle.control,
              ),
            ),
        ],
      ),
    );

    return SizedBox(
      width:
          width ?? (icon != null && label == null ? KDGeometry.control : null),
      height: height ?? KDGeometry.control,
      child: btn,
    );
  }
}
