import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:kui/kui.dart';
import 'package:provider/provider.dart';

class KUIInput extends StatefulWidget {
  final TextEditingController controller;
  final Function(String)? action;

  const KUIInput({super.key, required this.controller, this.action});

  @override
  State<KUIInput> createState() => _KUIInputState();
}

class _KUIInputState extends State<KUIInput> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.watch<KDColors>();
    final fg = colors.primary(colors.foreground);

    return Container(
      decoration: BoxDecoration(
        color: colors.control(colors.surface),
        borderRadius: BorderRadius.circular(KDGeometry.baseMRadius),
      ),
      padding: EdgeInsets.symmetric(horizontal: KDGeometry.baseMSpacing),
      height: KDGeometry.control * 1.5,
      child: ListenableBuilder(
        listenable: widget.controller,
        builder: (context, _) {
          final hasText = widget.controller.text.isNotEmpty;
          return KUIAxisList(
            axis: Axis.horizontal,
            children: [
              Flexible(
                child: TextField(
                  controller: widget.controller,
                  focusNode: _focusNode,
                  textInputAction: widget.action != null
                      ? TextInputAction.send
                      : TextInputAction.done,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.transparent,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                  style: KDFonts.font(KDFontStyle.h3).copyWith(color: fg),
                  cursorColor: fg,
                  onSubmitted: widget.action != null
                      ? (_) {
                          final text = widget.controller.text.trim();
                          if (text.isNotEmpty) widget.action?.call(text);
                        }
                      : null,
                ),
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 150),
                transitionBuilder: (child, anim) =>
                    ScaleTransition(scale: anim, child: child),
                child: hasText
                    ? KUIButton(
                        key: const ValueKey('clear'),
                        variant: KDButtonVariant.ghost,
                        icon: LucideIcons.x,
                        onPressed: () {
                          widget.controller.clear();
                          _focusNode.requestFocus();
                        },
                      )
                    : const SizedBox.shrink(key: ValueKey('empty')),
              ),
              if (widget.action != null)
                KUIButton(
                  variant: KDButtonVariant.accent,
                  radius: KDGeometry.baseSRadius,
                  icon: LucideIcons.send,
                  onPressed: () {
                    final text = widget.controller.text.trim();
                    if (text.isNotEmpty) widget.action?.call(text);
                  },
                ),
            ],
          );
        },
      ),
    );
  }
}
