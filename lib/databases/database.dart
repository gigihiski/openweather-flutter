// database.dart

import 'dart:async';
import 'package:floor/floor.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqflite;  

import 'package:weatherforecast/databases/daos/location_dao.dart';
import 'package:weatherforecast/databases/entities/location.dart';

part 'database.g.dart';

@Database(version: 1, entities: [Location])
abstract class AppDatabase extends FloorDatabase {
  LocationDao get locationDao;
}

