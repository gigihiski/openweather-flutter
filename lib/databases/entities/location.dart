/// Location Entity

import 'package:floor/floor.dart';

@entity
class Location {
  @primaryKey
  final int cityId;

  final String cityName;

  Location(this.cityId, this.cityName);
}
