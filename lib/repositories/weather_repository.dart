import 'package:weatherforecast/models/place_info.dart';
import 'package:weatherforecast/models/weather.dart';
import 'package:weatherforecast/providers/weather_provider.dart';

class WeatherRepository {
  WeatherProvider _weatherProvider;

  WeatherRepository() {
    this._weatherProvider = WeatherProvider();
  }

  // Get Weather Detail by Latitude and Longitude
  Future<AggregatedWeatherInfo> weatherForecastByGeographicCoordinates(
      double latitude, double longitude) async {
    return this
        ._weatherProvider
        .weatherForecastByGeographicCoordinates(latitude, longitude);
  }

  //Get Place Information by Latitude and Longitude
  Future<PlaceInfo> retrievePlaceInformation(
      double latitude, double longitude) async {
    return this._weatherProvider.retrievePlaceInformation(latitude, longitude);
  }

  // Get Weather Detail by Multiple Cities
  Future<AggregatedWeatherInfoList> weatherForecastByCityIds(
      List<int> cityIds) async {
    return this._weatherProvider.weatherForecastByCityIds(cityIds);
  }

  // Get Weather Detail by City ID
  Future<AggregatedWeatherInfoList> fiveDaysWeatherForecast(int cityId) async {
    return this._weatherProvider.fiveDaysWeatherForecast(cityId);
  }
}
