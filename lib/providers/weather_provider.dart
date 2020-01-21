import 'package:weatherforecast/models/cloud.dart';
import 'package:weatherforecast/models/main_info.dart';
import 'package:weatherforecast/models/weather.dart';
import 'package:weatherforecast/models/wind.dart';

class WeatherProvider {
  Future<List<AggregatedWeatherInfo>> getWeatherDetail(int cityId) async {
    try {
      List<AggregatedWeatherInfo> infos = List<AggregatedWeatherInfo>();
      infos.add(AggregatedWeatherInfo(
          cloud: Cloud(cloudinessPercentage: 30),
          wind: Wind(speed: 20, degree: 30),
          mainInfo: MainInfo(temperature: 25, humidity: 10),
          cityId: 1,
          cityName: "Surabaya",
          timestamp: DateTime.now()));
      infos.add(AggregatedWeatherInfo(
          cloud: Cloud(cloudinessPercentage: 30),
          wind: Wind(speed: 20, degree: 30),
          mainInfo: MainInfo(temperature: 25, humidity: 10),
          cityId: 1,
          cityName: "Surabaya",
          timestamp: DateTime.now()));
      infos.add(AggregatedWeatherInfo(
          cloud: Cloud(cloudinessPercentage: 30),
          wind: Wind(speed: 20, degree: 30),
          mainInfo: MainInfo(temperature: 25, humidity: 10),
          cityId: 1,
          cityName: "Surabaya",
          timestamp: DateTime.now()));
      infos.add(AggregatedWeatherInfo(
          cloud: Cloud(cloudinessPercentage: 30),
          wind: Wind(speed: 20, degree: 30),
          mainInfo: MainInfo(temperature: 25, humidity: 10),
          cityId: 1,
          cityName: "Surabaya",
          timestamp: DateTime.now()));
      infos.add(AggregatedWeatherInfo(
          cloud: Cloud(cloudinessPercentage: 30),
          wind: Wind(speed: 20, degree: 30),
          mainInfo: MainInfo(temperature: 25, humidity: 10),
          cityId: 1,
          cityName: "Surabaya",
          timestamp: DateTime.now()));
      infos.add(AggregatedWeatherInfo(
          cloud: Cloud(cloudinessPercentage: 30),
          wind: Wind(speed: 20, degree: 30),
          mainInfo: MainInfo(temperature: 25, humidity: 10),
          cityId: 1,
          cityName: "Surabaya",
          timestamp: DateTime.now()));
      infos.add(AggregatedWeatherInfo(
          cloud: Cloud(cloudinessPercentage: 30),
          wind: Wind(speed: 20, degree: 30),
          mainInfo: MainInfo(temperature: 25, humidity: 10),
          cityId: 1,
          cityName: "Surabaya",
          timestamp: DateTime.now()));
      infos.add(AggregatedWeatherInfo(
          cloud: Cloud(cloudinessPercentage: 30),
          wind: Wind(speed: 20, degree: 30),
          mainInfo: MainInfo(temperature: 25, humidity: 10),
          cityId: 1,
          cityName: "Surabaya",
          timestamp: DateTime.now()));
      return infos;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }
}
