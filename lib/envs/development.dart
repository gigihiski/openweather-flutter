/// Development Environment

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherforecast/blocs/add_location/add_location_bloc.dart';
import 'package:weatherforecast/blocs/authentication/authentication_bloc.dart';
import 'package:weatherforecast/blocs/authentication/authentication_event.dart';
import 'package:weatherforecast/blocs/bookmarked_location/bookmarked_location_bloc.dart';
import 'package:weatherforecast/blocs/help/help_bloc.dart';
import 'package:weatherforecast/blocs/help/help_event.dart';
import 'package:weatherforecast/blocs/open_weather_bloc_delegate.dart';
import 'package:weatherforecast/blocs/weather_detail/weather_detail_bloc.dart';

import 'package:weatherforecast/main.dart';

import 'package:weatherforecast/models/app_config.dart';
import 'package:weatherforecast/models/open_weather_config.dart';

import 'package:weatherforecast/utilities/app_color.dart' as AppTheme;

void main() {
  BlocSupervisor.delegate = OpenWeatherBlocDelegate();

  WidgetsFlutterBinding.ensureInitialized();

  // Open Weather API Configuration
  OpenWeatherConfig openWeatherConfig = OpenWeatherConfig(
      baseURL: "https://api.openweathermap.org/data",
      version: "2.5",
      appId: "c6e381d8c7ff98f0fee43775817cf6ad");

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.blue, // navigation bar color
    statusBarColor: Colors.transparent, // status bar color
  ));

  ThemeData theme = ThemeData(
      brightness: Brightness.light,
      primaryColor: AppTheme.AppColor.actionBlue,
      primaryColorBrightness: Brightness.light,
      accentColor: AppTheme.AppColor.freedomRed,
      accentColorBrightness: Brightness.light,
      primarySwatch: Colors.grey,
      primaryTextTheme: TextTheme(title: TextStyle(color: Colors.white)),
      primaryIconTheme: const IconThemeData.fallback().copyWith(
        color: Colors.white,
      ),
      accentIconTheme: const IconThemeData.fallback().copyWith(
        color: Colors.white,
      ));

  // App Configuration
  var appConfiguration = AppConfig(
    appName: 'Open Weather Dev',
    environment: 'development',
    theme: theme,
    openWeather: openWeatherConfig,
    child: MultiBlocProvider(
      providers: [
        /// Register All Bloc Providers
        BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc()..add(AppStarted()),
        ),
        BlocProvider<BookmarkedLocationBloc>(
          create: (context) => BookmarkedLocationBloc(),
        ),
        BlocProvider<HelpBloc>(
          create: (context) => HelpBloc()..add(HelpStarted()),
        ),
        BlocProvider<WeatherDetailBloc>(
          create: (context) => WeatherDetailBloc(),
        ),
        BlocProvider<AddLocationBloc>(create: (context) => AddLocationBloc())
      ],
      child: WeatherForecastApp(),
    ),
  );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(appConfiguration);
  });
}
