# Align Widget Demo

A Flutter app that demonstrates the [Align](https://api.flutter.dev/flutter/widgets/Align-class.html) and [AnimatedAlign](https://api.flutter.dev/flutter/widgets/AnimatedAlign-class.html) widgets.

## What it does

The app shows a single child widget (a colored badge with a star icon) inside a bordered container. A dropdown lets you pick an alignment position — such as `topLeft`, `center`, or `bottomRight` — and the child moves to that spot.

It uses `AnimatedAlign` so the transition between positions is animated with an ease-in-out curve over 400 ms. Swapping `AnimatedAlign` for a plain `Align` widget would make the child jump instantly instead.

## Screenshots

The app has a single screen:

- App bar titled **"Align Widget Demo"**
- A **Position** dropdown with nine alignment options, each with a distinct color
- A bordered box containing the animated child badge

## Getting started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (this project was created with a recent stable channel release)
- A supported platform target: Android, iOS, web, Windows, macOS, or Linux

### Setup

1. Clone or download the project.
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run the app:
   ```bash
   flutter run
   ```
   Select a device when prompted, or set one with `flutter devices`.

### Building

```bash
# Release build for the current platform
flutter build

# Web
flutter build web

# Android
flutter build apk

# iOS
flutter build ios

# Windows
flutter build windows

# macOS
flutter build macos

# Linux
flutter build linux
```

## Project structure

```
lib/main.dart          # App entry point and the Align demo screen
test/                  # Unit and widget tests
pubspec.yaml           # Dependencies and app metadata
```

## Dependencies

- `flutter` (SDK)
- `cupertino_icons` — iOS-style icons
- `flutter_test` (dev) — testing
- `flutter_lints` (dev) — recommended lints

## License

This project is provided as-is for learning and reference.
