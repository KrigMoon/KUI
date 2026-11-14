import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:kui/kui.dart';

class AtomsPage extends StatelessWidget {
  const AtomsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return KUIPage(
      title: "Атомы",
      bottomEmptyArea: true,
      child: KUIAxisList(
        axis: Axis.vertical,
        spacing: 0,
        children: [
          textsAndCard(),
          btns(),
          tabs(),
          fields(),
          notis(),
          views(context),
        ],
      ),
    );
  }
}

KUICollapsibleContainer textsAndCard() {
  return KUICollapsibleContainer(
    title: "Глифы и карточки",
    child: KUIAxisList(
      axis: Axis.vertical,
      children: [
        ...List.generate(
          KDFontStyle.values.length,
          (i) => KUIText(
            label:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since 1966, when designers at Letraset and"
                "James Mosley, the librarian at St Bride Printing Library in London, took a 1914 Cicero translation and scrambled it to make dummy text for Letraset's Body Type sheets.",
            style: KDFontStyle.values[i],
          ),
        ),
        ...List.generate(
          3,
          (j) => KUICard(
            variant: j == 2 ? KDCardVariant.accent : KDCardVariant.normal,
            child: KUIAxisList(
              axis: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                KDFontStyle.values.length,
                (i) => Expanded(
                  child: KUIAxisList(
                    axis: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Center(
                          child: KUIText(
                            label: KDFontStyle.values[i].name,
                            style: KDFontStyle.values[i],
                            variant: KDGliphVariant.values[j],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: KUIIcon(
                            icon: LucideIcons.house,
                            style: KDFontStyle.values[i],
                            variant: KDGliphVariant.values[j],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

KUICollapsibleContainer btns() {
  return KUICollapsibleContainer(
    title: "Кнопки",
    child: KUIAxisList(
      axis: Axis.vertical,
      children: [
        ...List.generate(
          2,
          (j) => KUIAxisList(
            axis: Axis.horizontal,
            children: [
              ...List.generate(
                KDButtonVariant.values.length,
                (index) => Expanded(
                  child: KUIButton(
                    variant: KDButtonVariant.values[index],
                    label: "Press Me",
                    onPressed: j == 1 ? () => {} : null,
                  ),
                ),
              ),
            ],
          ),
        ),
        KUIAxisList(
          axis: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Center(
                child: KUIButton(label: "Press Me", onPressed: () => {}),
              ),
            ),

            Expanded(
              child: Center(
                child: KUIButton(
                  icon: Icons.supervised_user_circle,
                  onPressed: () => {},
                ),
              ),
            ),

            Expanded(
              child: Center(
                child: KUIButton(
                  icon: Icons.supervised_user_circle,
                  label: "Press Me",
                  onPressed: () => {},
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

KUICollapsibleContainer tabs() {
  return KUICollapsibleContainer(
    title: "Вкладки",
    child: KUITabs(
      tabs: List.generate(
        15,
        (i) => KDTabItem(
          title: "Вкладка $i",
          tab: Container(
            height: 200,
            color: Colors.blue,
            child: Center(
              child: KUIText(label: "Вкладка $i", style: KDFontStyle.h1),
            ),
          ),
        ),
      ),
    ),
  );
}

KUICollapsibleContainer fields() {
  final TextEditingController controller = TextEditingController();
  return KUICollapsibleContainer(
    title: "Итарактивные поля",
    child: KUIAxisList(
      axis: Axis.vertical,
      children: [
        KUIInput(controller: controller, action: (s) => debugPrint(s)),
      ],
    ),
  );
}

KUICollapsibleContainer notis() {
  const lorem =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
      "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
      "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris "
      "nisi ut aliquip ex ea commodo consequat.";
  return KUICollapsibleContainer(
    title: "Уведомления",
    child: KUIAxisList(
      axis: Axis.vertical,
      children: [
        KUINotification(
          icon: LucideIcons.a_arrow_down,
          title: "TITLE",
          content: "CONTENT",
        ),
        KUINotification(
          icon: LucideIcons.a_arrow_down,
          title: "TITLE",
          content: lorem,
          variant: KDNotificationVariant.accent,
        ),
      ],
    ),
  );
}

KUICollapsibleContainer views(BuildContext context) {
  const lorem =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
      "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
      "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris "
      "nisi ut aliquip ex ea commodo consequat.";
  return KUICollapsibleContainer(
    title: "Представления",
    child: KUIAxisList(
      axis: Axis.horizontal,
      children: [
        Expanded(
          child: KUIButton(
            label: "Окно",
            onPressed: () => {
              KUIScreen.open(
                context,
                KUIScreen(
                  body: Center(
                    child: KUIButton(
                      icon: LucideIcons.chevron_left,
                      onPressed: () => KUIScreen.close(context),
                    ),
                  ),
                ),
              ),
            },
          ),
        ),
        Expanded(
          child: KUIButton(
            label: "Диалогое окно",
            onPressed: () => KUIDialog.open(
              context,
              KUIDialog(
                child: Center(
                  child: KUIButton(
                    icon: LucideIcons.chevron_left,
                    onPressed: () => KUIDialog.close(context),
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: KUIButton(
            label: "alert",
            onPressed: () => {
              KUIAlert.call(
                context,
                KUINotification(
                  icon: LucideIcons.a_arrow_down,
                  title: "TITLE",
                  content: lorem,
                  variant: KDNotificationVariant.accent,
                ),
              ),
            },
          ),
        ),
      ],
    ),
  );
}
