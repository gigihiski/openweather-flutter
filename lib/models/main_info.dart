import 'package:equatable/equatable.dart';

/// Main Info
class MainInfo extends Equatable {
  double temperature;
  double humidity;

  @override
  List<Object> get props => [temperature, humidity];

  MainInfo({this.temperature, this.humidity});

  factory MainInfo.fromJson(Map<String, dynamic> data) {
    double temperature = double.parse((data['temp'] ?? 0.0).toString());
    double humidity = double.parse((data['humidity'] ?? 0.0).toString());

    return MainInfo(temperature: temperature, humidity: humidity);
  }
}
