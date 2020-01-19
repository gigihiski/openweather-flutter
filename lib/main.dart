import 'package:flutter/material.dart';

import 'package:weatherforecast/blocs/splash/splash_page.dart';
import 'package:weatherforecast/models/app_config.dart';

import 'package:weatherforecast/utilities/app_color.dart' as AppTheme;

void main() => runApp(WeatherForecastApp());

class WeatherForecastApp extends StatelessWidget {
  /// Register All Pages on Routers
  final routes = <String, WidgetBuilder>{
    SplashPage.tag: (context) =>
        SplashPage(logo: "assets/images/flutter_logo.png")
  };

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var appConfig = AppConfig.of(context);

    return MaterialApp(
        debugShowCheckedModeBanner:
            (appConfig.environment == "production") ? false : true,
        title: appConfig.appName,
        theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: AppTheme.AppColor.actionBlue,
            primaryColorBrightness: Brightness.light,
            accentColor: AppTheme.AppColor.freedomRed,
            accentColorBrightness: Brightness.light),
        routes: routes,
        home: SplashPage(logo: 'assets/images/flutter_logo.png'));
  }
}
