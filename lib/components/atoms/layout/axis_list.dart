import 'package:flutter/material.dart';
import 'package:kui/kernel/axis/geometry.dart';

class KUIAxisList extends StatelessWidget {
  final Axis axis;
  final double? spacing;
  final List<Widget> children;

  final MainAxisAlignment? mainAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final CrossAxisAlignment? crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection? verticalDirection;
  final TextBaseline? textBaseline;

  const KUIAxisList({
    super.key,
    required this.axis,
    required this.children,
    this.spacing,
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.crossAxisAlignment,
    this.textDirection,
    this.verticalDirection,
    this.textBaseline,
  });

  @override
  Widget build(BuildContext context) {
    final space = spacing ?? KDGeometry.baseMSpacing;

    if (axis == Axis.horizontal) {
      return Row(
        spacing: space,
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
        mainAxisSize: mainAxisSize ?? MainAxisSize.max,
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
        textDirection: textDirection,
        verticalDirection: verticalDirection ?? VerticalDirection.down,
        textBaseline: textBaseline,
        children: children,
      );
    } else {
      return Column(
        spacing: space,
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
        mainAxisSize: mainAxisSize ?? MainAxisSize.max,
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.stretch,
        textDirection: textDirection,
        verticalDirection: verticalDirection ?? VerticalDirection.down,
        textBaseline: textBaseline,
        children: children,
      );
    }
  }
}
