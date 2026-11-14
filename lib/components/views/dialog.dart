import 'package:flutter/material.dart';
import 'package:kui/kui.dart';
import 'package:provider/provider.dart';

class KUIDialog extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final double? padding;
  final EdgeInsetsGeometry? paddingArea;
  const KUIDialog({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.paddingArea,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.watch<KDColors>();
    return Dialog(
      insetPadding: EdgeInsets.all(KDGeometry.baseMSpacing),
      backgroundColor: Colors.transparent,
      child: KUICard(
        width: width,
        height: height,
        padding: padding,
        paddingArea: paddingArea,
        background: colors.overlay(colors.background),
        child: child,
      ),
    );
  }

  static void open(BuildContext context, KUIDialog dialog) {
    showDialog(
      context: context,
      builder: (context) => dialog,
      barrierDismissible: false,
    );
  }

  static void close(BuildContext context) {
    Navigator.of(context).pop();
  }
}
