import 'package:weatherforecast/databases/database.dart';
import 'package:weatherforecast/databases/entities/location.dart';
import 'package:weatherforecast/models/place_info.dart';
import 'package:weatherforecast/models/weather.dart';
import 'package:weatherforecast/repositories/weather_repository.dart';

class BookmarkAPIProvider {
  /// Weather Repository
  WeatherRepository _weatherRepository;

  BookmarkAPIProvider() {
    _weatherRepository = WeatherRepository();
  }

  Future<List<AggregatedWeatherInfo>> getBookmarks() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    final locations = await database.locationDao.findAllLocations();
    List<int> cityIds = List();
    locations.forEach((location) {
      cityIds.add(location.cityId);
    });

    try {
      AggregatedWeatherInfoList result =
          await _weatherRepository.weatherForecastByCityIds(cityIds);
      return result.infos;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<void> createBookmark(PlaceInfo placeInfo) async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    Location location = Location(placeInfo.identifier, placeInfo.name);

    await database.locationDao.insertLocation(location);
  }

  Future<void> removeBookmark(int cityId) async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    await database.locationDao.deleteLocationByCityId(cityId);
  }
}
