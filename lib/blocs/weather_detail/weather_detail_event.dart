import 'package:equatable/equatable.dart';

abstract class WeatherDetailEvent extends Equatable {
  const WeatherDetailEvent();

  @override
  List<Object> get props => [];
}

class WeatherDetailFetch extends WeatherDetailEvent {
  const WeatherDetailFetch();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'Fetch { }';
}
