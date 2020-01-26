import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:weatherforecast/models/weather.dart';

abstract class WeatherDetailState extends Equatable {
  const WeatherDetailState();

  @override
  List<Object> get props => [];
}

/// WeatherDetailUninitialized
/// Init State
class WeatherDetailUninitialized extends WeatherDetailState {}

/// WeatherDetailLoading
/// Get Bookmarked Location Data in Progress
class WeatherDetailFetching extends WeatherDetailState {}

/// WeatherDetailFetched
/// Bookmarked Location Data has been Fetched
class WeatherDetailFetched extends WeatherDetailState {
  final List<AggregatedWeatherInfo> infos;

  WeatherDetailFetched({@required this.infos}) : assert(infos != null);
}

/// WeatherDetailFailure
/// Get Bookmarked Location Data Failure State
class WeatherDetailFailure extends WeatherDetailState {
  final String error;

  const WeatherDetailFailure({this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'WeatherDetailFailure { error: $error }';
}

/// WeatherDetailEmpty
/// Bookmarked Location Data State if It is Empty
class WeatherDetailEmpty extends WeatherDetailState {}
