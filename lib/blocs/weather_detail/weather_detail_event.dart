import 'package:equatable/equatable.dart';

abstract class WeatherDetailEvent extends Equatable {
  const WeatherDetailEvent();

  @override
  List<Object> get props => [];
}

class WeatherDetailFetch extends WeatherDetailEvent {
  final int cityId;

  const WeatherDetailFetch({this.cityId});

  @override
  List<Object> get props => [cityId];

  @override
  String toString() => 'WeatherDetailFetch { cityId: $cityId }';
}
