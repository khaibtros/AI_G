# Running AI Companions Flutter in Android Studio

## Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (version 3.8.0+)
- [Android Studio](https://developer.android.com/studio) (latest stable)
- Android SDK (installed via Android Studio)
- A physical Android device or an emulator

## Steps

### 1. Install Flutter & Dart Plugins

Open Android Studio, go to **File > Settings > Plugins** (or **Android Studio > Settings > Plugins** on macOS), search for and install:
- **Flutter** plugin
- **Dart** plugin

### 2. Open the Flutter Project

- Launch Android Studio
- Click **Open** and navigate to `ai_companions_flutter/`
- Android Studio will detect it as a Flutter project and prompt you to fetch dependencies

### 3. Install Project Dependencies

Open a terminal in Android Studio (**View > Tool Windows > Terminal**) and run:

```bash
flutter pub get
```

### 4. Code Generation

This project uses `freezed`, `json_serializable`, and `riverpod_generator`. Run code generation:

```bash
dart run build_runner build --delete-conflicting-outputs
```

### 5. Configure Environment Variables

Copy the `.env` file at `ai_companions_flutter/.env` and update the values:

```
EXPO_PUBLIC_API_URL=http://localhost:3001/api/v1
EXPO_PUBLIC_SUPABASE_URL=https://your-project.supabase.co
EXPO_PUBLIC_SUPABASE_ANON_KEY=your-anon-key
```

**Note:** If connecting to the local server (`server/` at the project root), start it first with `npm run dev` from the root directory.

### 6. Configure Android SDK

Ensure `android/local.properties` points to your Android SDK path. It should look like:

```properties
sdk.dir=C:\\Users\\<YOUR_USER>\\AppData\\Local\\Android\\Sdk
flutter.sdk=C:\\path\\to\\flutter
```

This file is usually auto-generated when you open the project in Android Studio.

### 7. Set Up a Device

**Emulator:**
- Click **Device Manager** (phone icon) in the toolbar
- Create a virtual device (e.g., Pixel 7 with API 34)
- Launch it

**Physical Device:**
- Enable **Developer Options** and **USB Debugging** on your phone
- Connect via USB and accept the debug prompt

### 8. Run the App

Select your device from the dropdown in the toolbar, then click the **Run** button (green triangle) or press `Shift + F10`.

Alternatively, use the terminal:

```bash
flutter run
```

### 9. Build APK (for distribution)

```bash
flutter build apk --release
```

The APK will be at `build/app/outputs/flutter-apk/app-release.apk`.

## Troubleshooting

| Issue | Solution |
|-------|----------|
| `flutter: command not found` | Add Flutter to your system PATH |
| `flutter pub get` fails | Check internet connection and `pubspec.yaml` |
| Build errors | Run `flutter clean` then `flutter pub get` again |
| Emulator not showing | Verify virtualization is enabled in BIOS |
| Connection to server fails | Ensure `server/` is running and `.env` points to the correct URL |

## Useful Commands

```bash
flutter doctor          # Verify Flutter installation
flutter devices         # List connected devices
flutter clean           # Clean build artifacts
flutter analyse         # Check for code issues
flutter build apk       # Build release APK
flutter build appbundle # Build Android App Bundle (Play Store)
```
