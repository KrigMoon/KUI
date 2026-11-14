import 'package:flutter/material.dart';
import 'package:kui/kui.dart';
import 'package:provider/provider.dart';

enum KDCardVariant { normal, accent }

class KUICard extends StatelessWidget {
  final Widget child;
  final KDCardVariant variant;
  final double? width;
  final double? height;
  final Color? background;
  final double? radius;
  final BorderRadius? borderRadius;
  final double? padding;
  final EdgeInsetsGeometry? paddingArea;
  final BoxConstraints? constraints;
  const KUICard({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.background,
    this.radius,
    this.borderRadius,
    this.padding,
    this.paddingArea,
    this.variant = KDCardVariant.normal,
    this.constraints,
  });

  Color getBackground(BuildContext context) {
    final colors = context.watch<KDColors>();
    Color bg = colors.surface;
    switch (variant) {
      case KDCardVariant.accent:
        bg = colors.accent;
      default:
    }

    return colors.card(bg);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          constraints ??
          BoxConstraints(
            minWidth: 0,
            maxWidth: double.infinity,
            minHeight: 0,
            maxHeight: double.infinity,
          ),
      padding:
          paddingArea ?? EdgeInsets.all(padding ?? KDGeometry.baseMSpacing),
      decoration: BoxDecoration(
        borderRadius:
            borderRadius ??
            BorderRadius.circular(radius ?? KDGeometry.baseLRadius),
        color: background ?? getBackground(context),
      ),
      height: height,
      width: width,
      child: child,
    );
  }
}
