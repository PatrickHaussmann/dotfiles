#!/bin/bash

set -e

#bash nodejs.sh

sudo apt-get install openjdk-17-jdk unzip #libpulse0

echo "export ANDROID_HOME=~/.android" > ~/.bash.d/nativescript.sh
##echo 'export SDK=$ANDROID_HOME' >> ~/.bash.d/nativescript.sh
##echo 'export PATH=$SDK/emulator:$SDK/tools:$SDK/tools/bin:$SDK/platform-tools:$SDK/cmdline-tools/latest/bin:$PATH' >> ~/.bash.d/nativescript.sh
echo 'export PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$PATH' >> ~/.bash.d/nativescript.sh
source ~/.bash.d/nativescript.sh

tmp_dir=$(mktemp -d)
wget "https://dl.google.com/android/repository/commandlinetools-linux-8092744_latest.zip" -O $tmp_dir/commandlinetools.zip
mkdir -p $ANDROID_HOME
unzip $tmp_dir/commandlinetools.zip -d $ANDROID_HOME

mkdir $ANDROID_HOME/cmdline-tools/latest
mv $ANDROID_HOME/cmdline-tools/* $ANDROID_HOME/cmdline-tools/latest/

rm -rf $tmp_dir

sudo npm install -g nativescript

yes | sdkmanager --licenses
yes | sdkmanager "platform-tools" "platforms;android-32" "emulator" "build-tools;32.0.0" "extras;android;m2repository" "extras;google;m2repository"

avdmanager create avd -n avd32 -k "system-images;android-32;google_apis;x86"

echo "$ ns doctor android"
