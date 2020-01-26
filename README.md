# weatherforecast

Open Weather Flutter project.

## Getting Started

1. Change Production and Development environment value on **lib/envs** folder
File Locations:
`lib/envs/development.dart` and `lib/env/production.dart`

2. Change the GoogleMapApiKey value inside **android** folder
File Location:
`android/key.properties`

3. Check your active Devices or Simulators
`flutter devices`
It will shows a result like this (the example is using real device):
    1 connected device:
    SM A310F • 31003f38ffcb8215 • android-arm • Android 7.0 (API 24)

4. Select Device or Simulator ID from the result above and **Run Flutter**
`flutter run -t [YOUR_ENVIRONMENT_FILE] -d [DEVICE_ID]`
example:
`flutter run -t lib/envs/development.dart -d 31003f38ffcb8215`