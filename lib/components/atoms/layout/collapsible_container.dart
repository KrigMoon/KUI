import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:kui/components/atoms/layout/axis_list.dart';
import 'package:kui/components/atoms/clickable/button.dart';
import 'package:kui/components/atoms/content/gliph.dart';
import 'package:kui/kernel/axis/fonts.dart';
import 'package:kui/kernel/axis/geometry.dart';

class KUICollapsibleContainer extends StatefulWidget {
  final Widget child;
  final String title;
  const KUICollapsibleContainer({
    super.key,
    required this.child,
    required this.title,
  });

  @override
  State<StatefulWidget> createState() => _StateKUICollapsibleContainer();
}

class _StateKUICollapsibleContainer extends State<KUICollapsibleContainer> {
  bool _open = false;
  @override
  Widget build(BuildContext context) {
    return KUIAxisList(
      axis: Axis.vertical,
      spacing: 0,
      children: [
        SizedBox(
          height: KDGeometry.header,
          child: KUIAxisList(
            axis: Axis.horizontal,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() {
                    _open = !_open;
                  }),
                  child: KUIText(label: widget.title, style: KDFontStyle.h2),
                ),
              ),
              KUIButton(
                variant: KDButtonVariant.ghost,
                icon: _open ? LucideIcons.chevron_up : LucideIcons.chevron_down,
                onPressed: () => setState(() {
                  _open = !_open;
                }),
              ),
            ],
          ),
        ),
        AnimatedCrossFade(
          firstChild: const SizedBox(width: double.infinity, height: 0),
          secondChild: widget.child,
          crossFadeState: _open
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 200),
          sizeCurve: Curves.easeInOut,
          firstCurve: Curves.easeIn,
          secondCurve: Curves.easeOut,
        ),
      ],
    );
  }
}
