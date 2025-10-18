<!-- .github/copilot-instructions.md: Guidance for AI coding agents working on this Flutter project -->

This repository is a small Flutter application named `english`. The guidance below highlights project-specific patterns, build/test commands, and important files an AI agent should reference when making changes.

- Quick context
  - Flutter app (Dart SDK >= 3.9). See `pubspec.yaml` for dependencies and SDK constraint.
  - Main entry: `lib/アプリ制作本番.dart` (contains `void main()` and `runApp`). The app is a single-screen character animation using images under `assets/images/`.

- Primary workflows (use these exact commands in macOS/zsh)
  - Install deps: `flutter pub get`
  - Static analysis: `flutter analyze`
  - Run app (simulator/device): `flutter run`
  - Build for iOS/macOS/Android: `flutter build <platform>` (e.g. `flutter build ios`)

- Project-specific conventions and notes
  - File names: `lib/アプリ制作本番.dart` uses Japanese filename and comments; preserve UTF-8 and the filename when renaming or importing.
  - Assets: images live in `assets/images/` and are declared in `pubspec.yaml`. When adding images, update `pubspec.yaml` and keep filenames consistent (this file uses numeric filenames like `1.png`, `2.png` and one long hash-named PNG).
  - Timers: `State` uses `Timer` fields that are created in `initState()` and canceled in `dispose()` — follow that pattern for lifecycle-managed async work.
  - Lints: `analysis_options.yaml` includes `package:flutter_lints/flutter.yaml`. Keep code style consistent with Flutter lints.

- Typical change patterns and examples
  - Adding a new screen: create a new StatefulWidget in `lib/` and register navigation via `MaterialApp(home: ...)` or `Navigator` — minimal app currently uses a single home widget.
  - Changing animation assets: update `assets/images/*` and `lib/アプリ制作本番.dart` references. Example: swapping `assets/images/1.png` and `assets/images/2.png` is a direct string change in the widget state.
  - Tests: there are no tests in `test/`. If you add tests, use `flutter_test` and place them under `test/` following Flutter conventions.

- Integration points and CI hints
  - CI should run: `flutter pub get`, `flutter analyze`, and `flutter test` (if tests are added). Builds are platform-dependent; prefer emulator/simulator targets for verification.

- When editing, check these files first
  - `pubspec.yaml` — dependencies and assets
  - `lib/アプリ制作本番.dart` — main app logic and animation patterns
  - `analysis_options.yaml` — lint rules
  - `README.md` — user-facing project description

If anything here is unclear or you want instructions expanded (for example, adding CI configuration or tests), tell me what to include and I will iterate.
