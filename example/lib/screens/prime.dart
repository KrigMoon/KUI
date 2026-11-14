import 'package:flutter/material.dart';
import 'package:kui/kui.dart';
import 'package:provider/provider.dart';

class PrimePage extends StatelessWidget {
  const PrimePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.watch<KDColors>();

    return KUIPage(
      title: "Пример",
      bottomEmptyArea: true,
      child: KUIAxisList(
        axis: Axis.vertical,
        children: [section(colors, true), section(colors, false), form(colors)],
      ),
    );
  }

  Widget section(KDColors colors, bool accent) {
    const lorem =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
        "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
        "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris "
        "nisi ut aliquip ex ea commodo consequat.";
    return KUICard(
      variant: accent ? KDCardVariant.accent : KDCardVariant.normal,
      child: KUIAxisList(
        axis: Axis.vertical,
        spacing: 0,
        children: [
          SizedBox(
            height: KDGeometry.header,
            child: Align(
              alignment: AlignmentGeometry.centerLeft,
              child: KUIText(
                variant: accent
                    ? KDGliphVariant.onAccent
                    : KDGliphVariant.normal,
                label: "Lorem",
                style: KDFontStyle.h1,
                textAlign: TextAlign.start,
              ),
            ),
          ),
          Divider(color: colors.border),
          KUIText(
            variant: accent ? KDGliphVariant.onAccent : KDGliphVariant.normal,
            label: lorem * 10,
            style: KDFontStyle.p,
            textAlign: TextAlign.start,
            maxLines: 10,
          ),
          SizedBox(height: KDGeometry.baseMSpacing),
          KUIButton(
            variant: accent ? KDButtonVariant.normal : KDButtonVariant.accent,
            label: "Читать подробнее",
            onPressed: () => {},
          ),
        ],
      ),
    );
  }

  Widget form(KDColors colors) {
    final TextEditingController fio = TextEditingController();
    final TextEditingController mail = TextEditingController();
    final TextEditingController phone = TextEditingController();
    return KUICard(
      variant: KDCardVariant.normal,
      child: KUIAxisList(
        axis: Axis.vertical,
        spacing: 0,
        children: [
          SizedBox(
            height: KDGeometry.header,
            child: Align(
              alignment: AlignmentGeometry.centerLeft,
              child: KUIText(
                variant: KDGliphVariant.normal,
                label: "Форма обратной связи",
                style: KDFontStyle.h1,
                textAlign: TextAlign.start,
              ),
            ),
          ),
          Divider(color: colors.border),
          KUIAxisList(
            axis: Axis.vertical,
            children: [
              KUIText(
                variant: KDGliphVariant.normal,
                label: "ФИО",
                style: KDFontStyle.h3,
                textAlign: TextAlign.start,
              ),
              KUIInput(controller: fio),
              KUIText(
                variant: KDGliphVariant.normal,
                label: "Почта",
                style: KDFontStyle.h3,
                textAlign: TextAlign.start,
              ),
              KUIInput(controller: mail),
              KUIText(
                variant: KDGliphVariant.normal,
                label: "Номер телефона",
                style: KDFontStyle.h3,
                textAlign: TextAlign.start,
              ),
              KUIInput(controller: phone),
            ],
          ),
          SizedBox(height: KDGeometry.baseMSpacing),
          KUIButton(
            variant: KDButtonVariant.accent,
            label: "Отправить",
            onPressed: () => {},
          ),
        ],
      ),
    );
  }
}
