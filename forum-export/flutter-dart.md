## Introduction

**Flutter** is a framework for developing a single codebase in a Java-like language called **Dart**, which is then compiled into **native** applications for any of the following target platforms: Android, iOS, MacOS, Windows, Linux, and Web.

Flutter is different from platforms like PhoneGap/Cordova which use a generic native *container* to deploy a thin web app into each of the destination operating systems. Flutter aims for a more 'native feel' of the app, and resulting apps are (apparently) more readily accepted by the App Stores.

As one can imagine there is a fair bit of setup to do in order to be able to compile to all of these target environments.

I had to set this up again recently on a new laptop, ahead of our On-site Hack Days, so I thought I'd document some of that process for anyone new to developing on the RCPCH mobile app suite.

I run Linux Mint 22.1 so these instructions focus on installing Flutter and related toolsets in Linux, and targeting Android, Desktop, and Web. (iOS can only be developed on Apple computer equipment, because... Apple)

## Development Environment

There are quite a few steps and several large downloads, so it’s worth doing in advance.

> [!tip]
> [UBUNTU LINUX: We have a detailed installation guide for Ubuntu/oid Linuxes here.](https://forum.rcpch.tech/t/detailed-flutter-development-setup-on-ubuntu-linux-android-web-linux-targets/526)

* [ ] [Android Studio](https://developer.android.com/studio)

* [ ] [Flutter](https://docs.flutter.dev/get-started/install).

* [ ] [VS Code](https://code.visualstudio.com/docs/setup/linux) is the recommended text editor for Flutter, and at present is also the most widely used editor. We currently recommend VS Code for RCPCH Incubator team.

* [ ] [Flutter SDK](https://docs.flutter.dev/get-started/install/linux/android#install-the-flutter-sdk) which will be installed for you by the [VSCode extension](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter)

* [ ] Then you need to run Android Studio and ensure the [Toolchain](https://docs.flutter.dev/get-started/install/linux/android#configure-the-android-toolchain-in-android-studio) is installed

* [ ] Ensure you have configured some [Target Devices](https://docs.flutter.dev/get-started/install/linux/android#configure-your-target-android-device).

Toolchain installation steps for Mac or Windows are all different but the general links will be similar. And of course for Mac you may also want to install XCode and do whatever setup is required for an iOS target device.

I would try to ensure that you can run and build the existing code at [GitHub - rcpch/rcpch-wham: The Wellbeing and Health Action Movement application, built by the RCPCH Incubator dev team](https://github.com/rcpch/rcpch-wham)

## Dart Style Guide
https://dart.dev/effective-dart/style#do-name-libraries-and-source-files-using-lowercase_with_underscores

## Awesome Flutter
An awesome list that curates the best Flutter libraries, tools, tutorials, articles and more.
https://github.com/Solido/awesome-flutter

## Improve this guide!
If you have a different experience while installing Flutter then please add comments below, ideally with any additional steps I've missed, and we can update this Wiki.

<div data-theme-toc="true"> </div>