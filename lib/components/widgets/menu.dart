import 'package:flutter/material.dart';
import 'package:kui/kui.dart';
import 'package:provider/provider.dart';

enum KDMenuPosition { top, bottom, left, right }

class KDMenuItem {
  final IconData icon;
  final Widget page;
  KDMenuItem({required this.icon, required this.page});
}

class KDMenuAction {
  final IconData icon;
  final VoidCallback action;
  KDMenuAction({required this.icon, required this.action});
}

class KUIMenu extends StatefulWidget {
  final KDMenuPosition position;
  final List<KDMenuItem> children;
  final List<KDMenuAction>? actions;

  const KUIMenu({
    super.key,
    this.position = KDMenuPosition.bottom,
    required this.children,
    this.actions,
  });

  @override
  State<StatefulWidget> createState() => _StateKUIMenu();
}

class _StateKUIMenu extends State<KUIMenu> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    final alignment = switch (widget.position) {
      KDMenuPosition.top => Alignment.topCenter,
      KDMenuPosition.bottom => Alignment.bottomCenter,
      KDMenuPosition.left => Alignment.centerLeft,
      KDMenuPosition.right => Alignment.centerRight,
    };

    return Stack(
      children: [
        _getPage(),
        Positioned.fill(
          child: Align(
            alignment: alignment,
            child: Padding(
              padding: EdgeInsets.all(KDGeometry.baseMSpacing),
              child: _buildMenu(context),
            ),
          ),
        ),
      ],
    );
  }

  Widget _getPage() {
    final emptyBox = SizedBox(
      width: KDGeometry.header + KDGeometry.baseMSpacing * 3,
    );
    return KUIAxisList(
      axis: Axis.horizontal,
      children: [
        if (widget.position == KDMenuPosition.left) emptyBox,
        Expanded(child: widget.children[_index].page),
        if (widget.position == KDMenuPosition.right) emptyBox,
      ],
    );
  }

  Widget _buildMenu(BuildContext context) {
    final colors = context.watch<KDColors>();
    final isVertical = switch (widget.position) {
      KDMenuPosition.top || KDMenuPosition.bottom => true,
      KDMenuPosition.left || KDMenuPosition.right => false,
    };

    return KUICard(
      radius: KDGeometry.baseLRadius,
      background: colors.overlay(colors.surface),
      child: KUIAxisList(
        axis: isVertical ? Axis.horizontal : Axis.vertical,
        crossAxisAlignment: isVertical ? null : CrossAxisAlignment.start,
        mainAxisSize: !isVertical ? null : MainAxisSize.min,
        spacing: KDGeometry.baseSSpacing,
        children: [
          ...List.generate(
            widget.children.length,
            (index) => _buildMenuItem(
              colors: colors,
              active: _index == index,
              index: index,
            ),
          ),
          if (widget.actions != null) ...[
            !isVertical
                ? Expanded(child: SizedBox(width: KDGeometry.header))
                : KUIAxisList(
                    axis: Axis.horizontal,
                    spacing: 0,
                    children: [
                      SizedBox(width: KDGeometry.baseSSpacing),
                      Container(
                        color: colors.primary(colors.foreground),
                        height: KDGeometry.header - KDGeometry.baseMSpacing * 2,
                        width: 1,
                      ),
                      SizedBox(width: KDGeometry.baseSSpacing),
                    ],
                  ),
            ...List.generate(
              widget.actions!.length,
              (index) => _buildMenuAction(colors: colors, index: index),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required KDColors colors,
    bool active = false,
    required int index,
  }) {
    return KUIButton(
      background: active
          ? colors.accent.withAlpha(128)
          : colors.overlay(colors.surface),
      foreground: colors.primary(colors.foreground),
      onPressed: active
          ? null
          : () => setState(() {
              _index = index;
            }),
      variant: KDButtonVariant.ghost,
      height: KDGeometry.header,
      width: KDGeometry.header,
      icon: widget.children[index].icon,
      gliphStyle: KDFontStyle.h2,
    );
  }

  Widget _buildMenuAction({required KDColors colors, required int index}) {
    return KUIButton(
      background: colors.overlay(colors.surface),
      foreground: colors.primary(colors.foreground),
      onPressed: widget.actions![index].action,
      variant: KDButtonVariant.ghost,
      height: KDGeometry.header,
      width: KDGeometry.header,
      icon: widget.actions![index].icon,
      gliphStyle: KDFontStyle.h2,
    );
  }
}
