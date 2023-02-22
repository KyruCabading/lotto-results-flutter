# PCSO Lotto Results: Updated Daily

![pcso](https://user-images.githubusercontent.com/31245853/220572464-d3d6d205-a8d8-4dce-87df-fece16466028.jpeg)
![pcso-2](https://user-images.githubusercontent.com/31245853/220572475-80158d6e-1f8a-46a1-a6f9-913d1a0fdf33.jpeg)
![pcso-3](https://user-images.githubusercontent.com/31245853/220572484-9395bd20-4c0c-4287-8fff-5a174aed2916.jpeg)

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

### Installing Android SDK
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

Then set Flutter to your android-sdk path
`flutter config --android-sdk <path-to-your-android-sdk-path>`
