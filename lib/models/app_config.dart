/// AppConfig
/// @description Initial App Configuration

import 'package:flutter/material.dart';
import 'package:weatherforecast/models/open_weather_config.dart';

class AppConfig extends InheritedWidget {
  /// App Name
  final String appName;

  /// App Environment
  final String environment;

  /// App Theme Data
  final ThemeData theme;

  /// openweathermap.org Configuration
  final OpenWeatherConfig openWeather;

  /// Constructor
  AppConfig({
    @required this.appName,
    @required this.environment,
    @required this.theme,
    @required this.openWeather,
    @required Widget child,
  }) : super(child: child);

  static AppConfig of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
