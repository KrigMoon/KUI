import 'package:flutter/material.dart';
import 'package:kui/kernel/axis/colors.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void runWithKUI({
  List<SingleChildWidget> otherProviders = const [],
  Widget? child,
}) {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => KDColors()),
        ...otherProviders,
      ],
      child: child,
    ),
  );
}
