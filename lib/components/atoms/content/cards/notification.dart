import 'package:flutter/material.dart';
import 'package:kui/kui.dart';
import 'package:provider/provider.dart';

enum KDNotificationVariant { normal, accent }

class KUINotification extends StatelessWidget {
  final KDNotificationVariant variant;
  final Color? background;
  final IconData icon;
  final String title;
  final String content;
  final Color? foreground;
  const KUINotification({
    super.key,
    this.variant = KDNotificationVariant.normal,
    this.background,
    required this.icon,
    required this.title,
    required this.content,
    this.foreground,
  });

  Color getBackground(BuildContext context) {
    final colors = context.watch<KDColors>();
    Color bg = colors.surface;
    switch (variant) {
      case KDNotificationVariant.accent:
        bg = colors.accent;
      default:
    }

    return colors.card(bg);
  }

  KDGliphVariant get getGliphVariant => switch (variant) {
    KDNotificationVariant.normal => KDGliphVariant.normal,
    KDNotificationVariant.accent => KDGliphVariant.onAccent,
  };

  @override
  Widget build(BuildContext context) {
    final gv = foreground == null ? getGliphVariant : KDGliphVariant.normal;

    return KUICard(
      background: background ?? getBackground(context),
      paddingArea: EdgeInsets.symmetric(
        horizontal: KDGeometry.baseLSpacing,
        vertical: KDGeometry.baseMSpacing,
      ),
      constraints: BoxConstraints(minHeight: KDGeometry.headerL),
      child: KUIAxisList(
        axis: Axis.horizontal,
        children: [
          SizedBox(
            width: KDGeometry.headerL,
            child: Center(
              child: KUIIcon(variant: gv, icon: icon, style: KDFontStyle.h1),
            ),
          ),
          Expanded(
            child: KUIAxisList(
              axis: Axis.vertical,
              spacing: 0,
              children: [
                KUIText(variant: gv, label: title, style: KDFontStyle.h3),
                KUIText(variant: gv, label: content, style: KDFontStyle.p),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
