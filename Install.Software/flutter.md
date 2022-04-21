#!/bin/cat

# Install

## flutter

[Install with snap](https://docs.flutter.dev/get-started/install/linux)

```sh
flutter config --no-analytics
dart --disable-analytics
```

## Android Studio

[Install](https://developer.android.com/studio)

Check SDK Manager to install:
- Android SDK (newest)
- Android SDK Command-line Tools
- Android SDK Build-Tools


```sh
flutter config --android-sdk /home/patrick/Android/Sdk/
flutter config --android-studio-dir /usr/local/android-studio/

flutter emulators --create flutter_emulator
flutter emulators --launch flutter_emulator
```

### Accept licenses

```sh
flutter doctor --android-licenses
```

## Web/Chrome

```sh
echo -e 'export CHROME_EXECUTABLE=/snap/bin/chromium\nexport ANDROID_HOME=$HOME/Android/Sdk\nexport PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin\nexport PATH="$PATH":$ANDROID_HOME/platform-tools' > ~/.bash.d/flutter.sh
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
```
