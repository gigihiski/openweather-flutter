/// Location DAO

import 'package:floor/floor.dart';
import 'package:weatherforecast/databases/entities/location.dart';

@dao
abstract class LocationDao {
  @Query('SELECT * FROM Location')
  Future<List<Location>> findAllLocations();

  @Query('SELECT * FROM Location')
  Stream<List<Location>> findAllLocationsAsStream();

  @Query('SELECT * FROM Location WHERE id = :id')
  Future<Location> findLocationByCityId(int cityId);

  @insert
  Future<void> insertLocation(Location location);

  @Query('DELETE FROM Location')
  Future<void> deleteAllLocations();
}
