import 'package:weatherforecast/models/cloud.dart';
import 'package:weatherforecast/models/main_info.dart';
import 'package:weatherforecast/models/wind.dart';

/// Weather
class Weather {
  int identifier;
  String group;
  String condition;
  String iconId;

  Weather({this.identifier, this.group, this.condition, this.iconId});

  factory Weather.fromJson(Map<String, dynamic> data) {
    int identifier = data['identifier'] as int;
    String group = data['group'] as String;
    String condition = data['condition'] as String;
    String iconId = data['iconId'] as String;

    return Weather(
        identifier: identifier,
        group: group,
        condition: condition,
        iconId: iconId);
  }
}

/// AggregatedWeatherInfo
class AggregatedWeatherInfo {
  List<Weather> weathers;
  Cloud cloud;
  Wind wind;
  MainInfo mainInfo;
  int cityId;
  String cityName;
  DateTime timestamp;

  AggregatedWeatherInfo(
      {this.weathers,
      this.cloud,
      this.wind,
      this.mainInfo,
      this.cityId,
      this.cityName,
      this.timestamp});

  factory AggregatedWeatherInfo.fromJson(Map<String, dynamic> data) {
    List weatherList = data['weathers'] as List;
    List<Weather> weathers =
        weatherList.map((i) => Weather.fromJson(i)).toList();

    Cloud cloud = Cloud.fromJson(data['cloud']);
    Wind wind = Wind.fromJson(data['wind']);
    MainInfo mainInfo = MainInfo.fromJson(data['main_info']);
    int cityId = data['city_id'] as int;
    String cityName = data['city_name'] as String;
    DateTime timestamp = DateTime.fromMillisecondsSinceEpoch(data['timestamp']);

    return AggregatedWeatherInfo(
        weathers: weathers,
        cloud: cloud,
        wind: wind,
        mainInfo: mainInfo,
        cityId: cityId,
        cityName: cityName,
        timestamp: timestamp);
  }
}

/// AggregatedWeatherInfoList
class AggregatedWeatherInfoList {
  List<AggregatedWeatherInfo> infos;

  AggregatedWeatherInfoList({this.infos});

  factory AggregatedWeatherInfoList.fromJson(Map<String, dynamic> data) {
    List infoList = data['list'] as List;
    List<AggregatedWeatherInfo> infos =
        infoList.map((i) => AggregatedWeatherInfo.fromJson(i)).toList();

    return AggregatedWeatherInfoList(infos: infos);
  }
}
