import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

import 'package:weatherforecast/models/cloud.dart';
import 'package:weatherforecast/models/main_info.dart';
import 'package:weatherforecast/models/wind.dart';

/// Weather
class Weather extends Equatable {
  int identifier;
  String group;
  String condition;
  String iconId;
  String iconURL;

  @override
  List<Object> get props => [identifier, group, condition, iconId, iconURL];

  Weather(
      {this.identifier, this.group, this.condition, this.iconId, this.iconURL});

  factory Weather.fromJson(Map<String, dynamic> data) {
    int identifier = data['id'] as int;
    String group = data['main'] as String;
    String condition = data['description'] as String;
    String iconId = data['icon'] as String;
    String iconURL = "https://openweathermap.org/img/wn/${data['icon']}@2x.png";

    return Weather(
        identifier: identifier,
        group: group,
        condition: condition,
        iconId: iconId,
        iconURL: iconURL);
  }
}

/// AggregatedWeatherInfo
class AggregatedWeatherInfo extends Equatable {
  List<Weather> weathers;
  Cloud cloud;
  Wind wind;
  MainInfo mainInfo;
  int cityId;
  String cityName;
  String date;

  @override
  List<Object> get props =>
      [weathers, cloud, wind, mainInfo, cityId, cityName, date];

  AggregatedWeatherInfo(
      {this.weathers,
      this.cloud,
      this.wind,
      this.mainInfo,
      this.cityId,
      this.cityName,
      this.date});

  factory AggregatedWeatherInfo.fromJson(Map<String, dynamic> data) {
    List weatherList = data['weather'] as List;
    List<Weather> weathers =
        weatherList.map((i) => Weather.fromJson(i)).toList();

    Cloud cloud = Cloud.fromJson(data['clouds']);
    Wind wind = Wind.fromJson(data['wind']);
    MainInfo mainInfo = MainInfo.fromJson(data['main']);
    int cityId = data['id'] as int;
    String cityName = data['name'] as String;

    /// Formatting Time
    DateTime timestamp = DateTime.fromMillisecondsSinceEpoch(
        int.parse(data['dt'].toString()) * 1000);
    String date = DateFormat('dd-MM-yyyy kk:mm').format(timestamp);

    return AggregatedWeatherInfo(
        weathers: weathers,
        cloud: cloud,
        wind: wind,
        mainInfo: mainInfo,
        cityId: cityId,
        cityName: cityName,
        date: date);
  }
}

/// AggregatedWeatherInfoList
class AggregatedWeatherInfoList extends Equatable {
  List<AggregatedWeatherInfo> infos;

  @override
  List<Object> get props => [infos];

  AggregatedWeatherInfoList({this.infos});

  factory AggregatedWeatherInfoList.fromJson(Map<String, dynamic> data) {
    List infoList = data['list'] as List;
    List<AggregatedWeatherInfo> infos =
        infoList.map((i) => AggregatedWeatherInfo.fromJson(i)).toList();

    return AggregatedWeatherInfoList(infos: infos);
  }
}
