# Krig's UI Kit (KUI Kit)

Личный набор UI-компонентов для Flutter: цвета, типографика, геометрия и готовые виджеты.

## Подключение

Через git в `pubspec.yaml`:

```yaml
dependencies:
  kui:
    git:
      url: https://github.com/<username>/kui.git
      ref: <tag>
```

Или локально, если пакет лежит рядом:

```yaml
dependencies:
  kui:
    path: ../kui
```

## Активация

`runWithKUI` поднимает `MultiProvider` с `KDColors` и запускает приложение.

```dart
void main() {
  runWithKUI(child: const App());
}
```

Корень экрана — `KUIScreen`, контент — `KUIPage`:

```dart
KUIScreen(
  body: KUIPage(
    title: 'Заголовок',
    child: KUIButton(
      label: 'Нажми',
      variant: KDButtonVariant.accent,
      onPressed: () {},
    ),
  ),
)
```

Смена темы (6 схем: light/dark × amber/ocean/ruby):

```dart
context.read<KDColors>().change('lightOcean');
```

## Список компонентов

**Атомы**
- `KUIAxisList` — Row/Column с единым `spacing`
- `KUIText`, `KUIIcon` — текст и иконки по стилям `KDFontStyle`
- `KUIButton` — варианты `normal`, `accent`, `ghost`, `bordered`
- `KUICard` — карточка, варианты `normal`, `accent`
- `KUINotification` — карточка-уведомление с иконкой и заголовком
- `KUIInput` — текстовое поле с кнопкой очистки и опциональной отправкой
- `KUICollapsibleContainer` — сворачиваемый блок с заголовком

**Виджеты**
- `KUIMenu` — плавающее меню (top/bottom/left/right) со списком страниц и действий

**Экраны**
- `KUIScreen` — `Scaffold` + `SafeArea` + системные иконки под тему
- `KUIPage` — заголовок + скроллируемый контент
- `KUITabs` — табы с горизонтальным меню
- `KUIDialog` — диалог на базе `KUICard`
- `KUIAlert` — снекбар с `KUINotification`

**Ядро**
- `KDColors` — схемы и производные цвета (`card`, `control`, `overlay`, `hover`, `press`, `fgStyle`)
- `KDGeometry` — размеры, отступы, радиусы
- `KDFonts` — типографика (Nunito) и размеры иконок

## Пример

Полный рабочий пример — в [example/README.md](example/README.md).
