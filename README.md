# PCSO Lotto Results: Updated Daily



## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

# Installing Android SDK
From @andrewhavens
https://gist.github.com/patrickhammond/4ddbe49a67e5eb1b9c03#gistcomment-2903816

```
brew cask install adoptopenjdk8
brew cask install android-sdk

echo "export ANDROID_HOME=/usr/local/share/android-sdk" >> ~/.bash_profile
source ~/.bash_profile

touch ~/.android/repositories.cfg
sdkmanager --update
sdkmanager "platform-tools" "platforms;android-28"
```
