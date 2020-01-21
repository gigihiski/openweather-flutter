import 'package:weatherforecast/models/weather.dart';
import 'package:weatherforecast/providers/weather_provider.dart';

class WeatherRepository {
  WeatherProvider _weatherProvider = WeatherProvider();

  // Get Weather Detail by City ID
  Future<List<AggregatedWeatherInfo>> getWeatherDetail(int cityId) async {
    return _weatherProvider.getWeatherDetail(cityId);
  }
}
