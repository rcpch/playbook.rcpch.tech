---
title: Detailed Flutter Development Setup on Ubuntu Linux (Android/Web/Linux targets)
topic_id: 526
url: https://forum.rcpch.tech/t/detailed-flutter-development-setup-on-ubuntu-linux-android-web-linux-targets/526
pulled_at: 2026-06-22T09:57:54Z
---

I had to reinstall my Flutter setup recently and it was no easier using [my generic guide in the Flutter main topic](https://forum.rcpch.tech/t/flutter-dart/373) than when I last did it a few months back, so I thought I'd keep a more detailed list of the useful commands and setup.

> [!check]
>To the next person that follows this through step-by-step (could be me!) - please comment with anything that didn't work or was flat out wrong.

### Pick a place to install everything
```
mkdir /home/marcus/android
```

### Install Flutter via extension in VS Code
 https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter

The [Flutter installation pages](https://docs.flutter.dev/get-started/install/linux/android#configure-the-android-toolchain-in-android-studio) tell you to install these packages:

#### Flutter prerequisites
```
sudo apt install -y curl git unzip xz-utils zip libglu1-mesa
```

#### Android target development prerequisites
```
sudo apt install libc6:amd64 libstdc++6:amd64 lib32z1 libbz2-1.0:amd64
```

#### Flutter VSCode Extension
In VS Code you can use <kbd>Ctrl</kbd> + <kbd>P</kbd> then paste
```
ext install Dart-Code.flutter
```
Or just search in the Extensions toolbar and install it.

Once installed, press <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>P</kbd> to get the Command Palette.

In the command palette, type `flutter`. Select **Flutter: New Project**.

VS Code prompts you to locate the Flutter SDK on your computer. Select **Download SDK**. When the Select Folder for Flutter SDK dialog displays, choose where you want to install Flutter. Click **Clone Flutter**.

#### Add to `$PATH`
Edit the shell config file for whatever shell you are using, to put the required tools in your `$PATH`. In my case I'm using Zsh so I edit `.zshrc` and add the following:

```
# android
export ANDROID_HOME=$HOME/android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
# android studio
export PATH=$PATH:/home/marcus/android/android-studio/bin
# flutter
export PATH=$PATH:/home/marcus/android/flutter/bin
# java
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64/bin/java
```

Not all of these are installed yet but you might as well do it all in one go. Check that the paths are correct for where you have installed your packages. And don't forget to `source` the new `.zshrc` (in my case I just type `zsh` again)

#### Flutter Doctor
If `flutter` (the executable) is now in your `$PATH` (it should be) then you should be able to run
```
flutter doctor
```
Which will tell you about any other missing parts of your installation. You can keep running `flutter-doctor` and fixing parts of the installation until everything passes.

### Install Java Development Kit
```
sudo apt install default-jdk
```
confirm with
```
javac --version
#=> returns a version number
```

Get the **real** path of the JRE for `$JAVA_HOME` later
```
sudo update-alternatives --config java
#=> /usr/lib/jvm/java-21-openjdk-amd64/bin/java 
```

### Google Chrome
You will need to install Google Chrome
```
sudo apt-get install libxss1 libappindicator1 libindicator7
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome*.deb
```

### Android Studio

#### Get Android Studio
The easiest way to download it is from the website, because there's a license/EULA you need to agree to, so a cURL won't reliably work here, and the filename will change for future versions anyway.

https://developer.android.com/studio

Extract the archive and install it to your install location:
```
tar -xvzf android-studio-XXXX.X.X.X.X-linux.tar.gz -C /home/marcus/
```

Make sure you can run it from the command line by typing
```
studio
```

If this isn't working then check your `$PATH`.

> [!tip]
> To make Android Studio available in your list of applications, select **:gear: > Create Desktop Entry** from the Android Studio menu bar on the bottom left.

#### Set Up Android Studio
Follow the steps detailed here to ensure Android Studio is set up for Flutter development:

https://docs.flutter.dev/get-started/install/linux/android#configure-android-development

### Build prerequisites

Flutter Doctor will tell you about the missing packages that are required to build stuff, here's a one-liner to install them

```
sudo apt install libgtk-3-dev ninja-build cmake clang
```

### Accept Android licenses
```
flutter doctor --android-licenses
```
And say **yes** to everything **without** reading them :rofl: .

### Build and run on Linux
You should at this stage have everything you need to build and run the codebase as a Linux Desktop app.
```
flutter run
# Connected devices:
# Linux (desktop) • linux  • linux-x64      • Linux Mint 22.1 6.8.0-62-generic
# Chrome (web)    • chrome • web-javascript • Google Chrome 138.0.7204.157
# [1]: Linux (linux)
# [2]: Chrome (chrome)
# Please choose one (or "q" to quit): 1
```
Then select whichever option is for Linux desktop.

If this doesn't work I suggest using `flutter doctor` to debug and then fix before going on to Android Virtual Devices or Real Android Devices.

### Build and run webapp in Chrome
Similar procedure applies for running as a webapp in Chrome
```
flutter run
# Connected devices:
# Linux (desktop) • linux  • linux-x64      • Linux Mint 22.1 6.8.0-62-generic
# Chrome (web)    • chrome • web-javascript • Google Chrome 138.0.7204.157
# [1]: Linux (linux)
# [2]: Chrome (chrome)
# Please choose one (or "q" to quit): 1
```

### Installing Android Virtual Devices
Follow the instructions here
https://docs.flutter.dev/get-started/install/linux/android#configure-android-development



<div data-theme-toc="true"> </div>
