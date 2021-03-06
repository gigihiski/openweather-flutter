import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherforecast/blocs/add_location/add_location_page.dart';

import 'package:weatherforecast/blocs/authentication/authentication_bloc.dart';
import 'package:weatherforecast/blocs/authentication/authentication_state.dart';
import 'package:weatherforecast/blocs/bookmarked_location/bookmarked_location_page.dart';
import 'package:weatherforecast/blocs/help/help_page.dart';
import 'package:weatherforecast/blocs/splash/splash_page.dart';
import 'package:weatherforecast/blocs/weather_detail/weather_detail_page.dart';

import 'package:weatherforecast/models/app_config.dart';

void main() => runApp(WeatherForecastApp());

class WeatherForecastApp extends StatelessWidget {
  /// Register All Pages on Routers
  final routes = <String, WidgetBuilder>{
    SplashPage.tag: (context) =>
        SplashPage(logo: "assets/images/flutter_logo.png"),
    BookmarkedLocationPage.tag: (context) =>
        BookmarkedLocationPage(title: "Locations"),
    HelpPage.tag: (context) => HelpPage(),
    WeatherDetailPage.tag: (context) =>
        WeatherDetailPage(title: "Today's Weather"),
    AddLocationPage.tag: (context) =>
        AddLocationPage()
  };

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var appConfig = AppConfig.of(context);

    return MaterialApp(
        debugShowCheckedModeBanner:
            (appConfig.environment == "production") ? false : true,
        title: appConfig.appName,
        theme: appConfig.theme,
        routes: routes,
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is AuthenticationUnauthenticated) {
              return BookmarkedLocationPage(title: "Locations");
            }
            return SplashPage(logo: "assets/images/flutter_logo.png");
          },
        ));
  }
}
