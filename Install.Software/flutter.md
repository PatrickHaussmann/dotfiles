#!/bin/cat

# Install

## flutter

[Install with snap](https://docs.flutter.dev/get-started/install/linux)

```sh
flutter config --no-analytics
dart --disable-analytics
```

## Android Studio

[Install](https://developer.android.com/studio) as tar in folder `~/android-studio/`

Create sample Project for Android Studio to auto download most of the dependencies.

Open Tools > SDK Manager: 
- SDK Tools: install Build-Tools, Command-line Tools, Emulator, Platform-Tools
- SDK Platforms: install latest version
    - Select "Show Package Details" -> install everything for the latest SDK Platforms

```sh
flutter config --android-sdk ~/Android/Sdk/
flutter config --android-studio-dir ~/android-studio/

flutter emulators --create flutter_emulator
flutter emulators --launch flutter_emulator
```

Boot the emulator

### Accept licenses

```sh
flutter doctor --android-licenses
```

## Web/Chrome

Install Chromium with snap

## Environment variables

```sh
echo -e 'export CHROME_EXECUTABLE=/snap/bin/chromium\nexport ANDROID_HOME=$HOME/Android/Sdk\nexport JAVA_HOME=$HOME/android-studio/jre\nexport PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools' > ~/.bash.d/flutter.sh
. ~/.bash.d/flutter.sh
```

## Linux

```sh
sudo apt-get install clang cmake ninja-build pkg-config libgtk-3-dev liblzma-dev
flutter config --enable-linux-desktop
```

# Checks

```sh
flutter doctor -v
flutter devices
```

# VS Code

[Instructions on flutter.dev](https://docs.flutter.dev/get-started/test-drive?tab=vscode)
