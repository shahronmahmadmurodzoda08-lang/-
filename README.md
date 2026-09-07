# Фарҳангшиносӣ — Logo/Icon Pack

Манбаи лого: муқоваи пешниҳодкардаи корбар.

## 1) Агар Flutter истифода мебарӣ
Дар `pubspec.yaml` dependency-и `flutter_launcher_icons`-ро илова кун ва блоки
`flutter_launcher_icons`-ро аз `flutter_launcher_icons.yaml` ба конфиг мувофиқ гузор.
Баъд:

```bash
flutter pub get
dart run flutter_launcher_icons
```

## 2) Генератори мустақил
Python + Pillow:

```bash
pip install pillow
python tools/generate_icons.py
```

Он icon-ҳои Android, iOS ва Windows-ро месозад.

## Номи барнома
Номи намоёни барнома: **Фарҳангшиносӣ**

Барои Flutter:
```yaml
name: farhangshinos_book
```

Android:
`android/app/src/main/AndroidManifest.xml` -> `android:label="Фарҳангшиносӣ"`

iOS:
`CFBundleDisplayName` -> `Фарҳангшиносӣ`

Windows:
`windows/runner/Runner.rc` -> номи маҳсулотро ба `Фарҳангшиносӣ` иваз кун.
