import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kui/kui.dart';
import 'package:provider/provider.dart';

class KUIScreen extends StatelessWidget {
  final Widget body;
  const KUIScreen({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Consumer<KDColors>(
      builder: (context, colors, child) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarIconBrightness: colors.systemIcons,
            systemNavigationBarIconBrightness: colors.systemIcons,
            systemStatusBarContrastEnforced: false,
            systemNavigationBarContrastEnforced: false,
          ),
          child: Scaffold(
            backgroundColor: colors.background,
            body: SafeArea(child: body),
          ),
        );
      },
    );
  }

  static void open(BuildContext context, KUIScreen screen) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  static void close(BuildContext context) {
    Navigator.of(context).pop();
  }
}
