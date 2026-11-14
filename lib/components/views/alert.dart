import 'package:flutter/material.dart';
import 'package:kui/kui.dart';

class KUIAlert extends StatelessWidget {
  final String title;
  final String content;
  final IconData icon;
  final KDNotificationVariant variant;
  const KUIAlert({
    super.key,
    this.variant = KDNotificationVariant.normal,
    required this.title,
    required this.content,
    required this.icon,
  });

  //endregion

  @override
  Widget build(BuildContext context) {
    return KUINotification(
      variant: variant,
      icon: icon,
      title: title,
      content: content,
    );
  }

  static void call(BuildContext context, KUINotification notification) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: notification,
        backgroundColor: Colors.transparent,
        elevation: 0,
        padding: EdgeInsets.all(KDGeometry.baseMSpacing),
        margin: EdgeInsets.zero,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
