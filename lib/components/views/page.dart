import 'package:flutter/material.dart';
import 'package:kui/kui.dart';
import 'package:provider/provider.dart';

class KUIPage extends StatelessWidget {
  final Widget child;
  final String title;
  final bool bottomEmptyArea;
  final bool scroll;
  const KUIPage({
    super.key,
    required this.child,
    required this.title,
    this.bottomEmptyArea = false,
    this.scroll = true,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.watch<KDColors>();

    final body = KUIAxisList(
      axis: Axis.vertical,
      spacing: 0,
      children: [
        child,
        if (bottomEmptyArea)
          SizedBox(height: KDGeometry.header + KDGeometry.baseMSpacing * 3),
      ],
    );

    return KUIAxisList(
      axis: Axis.vertical,
      spacing: 0,
      children: [
        SizedBox(
          height: KDGeometry.headerL,
          child: Center(
            child: KUIText(label: title, style: KDFontStyle.h1),
          ),
        ),
        Divider(height: 1, color: colors.border.withAlpha(128)),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(KDGeometry.baseMSpacing),
            child: scroll ? SingleChildScrollView(child: body) : child,
          ),
        ),
        if (!scroll && bottomEmptyArea)
          SizedBox(height: KDGeometry.header + KDGeometry.baseMSpacing * 3),
      ],
    );
  }
}
