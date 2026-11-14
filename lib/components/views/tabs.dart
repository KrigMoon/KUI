import 'package:flutter/material.dart';
import 'package:kui/kui.dart';

class KDTabItem {
  final String? title;
  final IconData? titleIcon;
  final Widget tab;
  KDTabItem({this.title, this.titleIcon, required this.tab});
}

class KUITabs extends StatefulWidget {
  final List<KDTabItem> tabs;
  const KUITabs({super.key, required this.tabs});

  @override
  State<StatefulWidget> createState() => _StateKUITabs();
}

class _StateKUITabs extends State<KUITabs> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return KUIAxisList(
      axis: Axis.vertical,
      children: [_buildTabsMenu(), widget.tabs[_index].tab],
    );
  }

  Widget _buildTabsMenu() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: KUIAxisList(
        axis: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          widget.tabs.length,
          (index) => KUIButton(
            variant: _index == index
                ? KDButtonVariant.accent
                : KDButtonVariant.bordered,
            icon: widget.tabs[index].titleIcon,
            label: widget.tabs[index].title,
            onPressed: () => setState(() {
              _index = index;
            }),
          ),
        ),
      ),
    );
  }
}
