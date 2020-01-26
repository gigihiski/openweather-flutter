import 'package:dio/dio.dart';
import 'package:weatherforecast/models/place_info.dart';

import 'package:weatherforecast/models/weather.dart';
import 'package:weatherforecast/repositories/open_weather_endpoint.dart';

class WeatherProvider {
  Dio _dio;

  WeatherProvider() {
    this._dio = Dio();
  }

  Future<AggregatedWeatherInfo> weatherForecastByGeographicCoordinates(
      double latitude, double longitude) async {
    try {
      var headers = Map<String, dynamic>();
      Response response = await this._dio.get(
          OpenWeatherEndpoint.weatherForecastByGeographicCoordinate(
              latitude, longitude),
          options: Options(
              headers: headers,
              followRedirects: false,
              receiveTimeout: 3600,
              connectTimeout: 3600));
      if (response.statusCode == 200) {
        return AggregatedWeatherInfo.fromJson(response.data);
      }
      throw new Exception("");
    } on DioError catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<PlaceInfo> retrievePlaceInformation(
      double latitude, double longitude) async {
    try {
      var headers = Map<String, dynamic>();
      Response response = await this._dio.get(
          OpenWeatherEndpoint.weatherForecastByGeographicCoordinate(
              latitude, longitude),
          options: Options(
              headers: headers,
              followRedirects: false,
              receiveTimeout: 3600,
              connectTimeout: 3600));
      if (response.statusCode == 200) {
        return PlaceInfo.fromJson(response.data);
      }
      throw new Exception("");
    } on DioError catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<AggregatedWeatherInfoList> weatherForecastByCityIds(
      List<int> cityIds) async {
    try {
      var headers = Map<String, dynamic>();
      Response response = await this._dio.get(
          OpenWeatherEndpoint.weatherForecastByCityIds(cityIds),
          options: Options(
              headers: headers,
              followRedirects: false,
              receiveTimeout: 3600,
              connectTimeout: 3600));
      if (response.statusCode == 200) {
        return AggregatedWeatherInfoList.fromJson(response.data);
      }
      throw new Exception("");
    } on DioError catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<AggregatedWeatherInfoList> fiveDaysWeatherForecast(int cityId) async {
    try {
      var headers = Map<String, dynamic>();
      Response response = await this._dio.get(
          OpenWeatherEndpoint.fiveDaysWeatherForecast(cityId),
          options: Options(
              headers: headers,
              followRedirects: false,
              receiveTimeout: 3600,
              connectTimeout: 3600));
      if (response.statusCode == 200) {
        return AggregatedWeatherInfoList.fromJson(response.data);
      }
      throw new Exception("");
    } on DioError catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }
}
