import 'package:example/screens/atoms.dart';
import 'package:example/screens/prime.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:kui/kui.dart';
import 'package:provider/provider.dart';

void main() async {
  runWithKUI(child: const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KUI Demo',
      home: _Home(),
    );
  }
}

class _Home extends StatefulWidget {
  const _Home();

  @override
  State<StatefulWidget> createState() => _StateHome();
}

class _StateHome extends State<_Home> {
  KDMenuPosition _position = KDMenuPosition.bottom;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(visualDensity: VisualDensity.standard),
      child: KUIScreen(
        body: KUIMenu(
          position: _position,
          children: [
            KDMenuItem(icon: LucideIcons.atom, page: const AtomsPage()),
            KDMenuItem(icon: LucideIcons.pc_case, page: const PrimePage()),
          ],
          actions: [
            KDMenuAction(
              icon: LucideIcons.brush,
              action: () => changeTheme(context),
            ),
            KDMenuAction(icon: LucideIcons.circle, action: () => changePos()),
          ],
        ),
      ),
    );
  }

  void changeTheme(BuildContext context) {
    final colors = context.read<KDColors>();
    final keys = colors.colorsKeys; // отсортировано
    final idx = keys.indexOf(colors.current);
    final next = keys[(idx + 1) % keys.length];
    colors.change(next);
  }

  void changePos() {
    setState(() {
      cycle();
    });
  }

  void set(KDMenuPosition next) {
    if (next == _position) return;
    _position = next;
  }

  void cycle() {
    set(next());
  }

  KDMenuPosition next() {
    final values = KDMenuPosition.values;
    final idx = values.indexOf(_position);
    return values[(idx + 1) % values.length];
  }
}
