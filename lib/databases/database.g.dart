// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? join(await sqflite.getDatabasesPath(), name)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  LocationDao _locationDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    return sqflite.openDatabase(
      path,
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Location` (`cityId` INTEGER, `cityName` TEXT, PRIMARY KEY (`cityId`))');

        await callback?.onCreate?.call(database, version);
      },
    );
  }

  @override
  LocationDao get locationDao {
    return _locationDaoInstance ??= _$LocationDao(database, changeListener);
  }
}

class _$LocationDao extends LocationDao {
  _$LocationDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _locationInsertionAdapter = InsertionAdapter(
            database,
            'Location',
            (Location item) => <String, dynamic>{
                  'cityId': item.cityId,
                  'cityName': item.cityName
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _locationMapper = (Map<String, dynamic> row) =>
      Location(row['cityId'] as int, row['cityName'] as String);

  final InsertionAdapter<Location> _locationInsertionAdapter;

  @override
  Future<List<Location>> findAllLocations() async {
    return _queryAdapter.queryList('SELECT * FROM Location',
        mapper: _locationMapper);
  }

  @override
  Stream<List<Location>> findAllLocationsAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM Location',
        tableName: 'Location', mapper: _locationMapper);
  }

  @override
  Future<Location> findLocationByCityId(int cityId) async {
    return _queryAdapter.query('SELECT * FROM Location WHERE cityId = ?',
        arguments: <dynamic>[cityId], mapper: _locationMapper);
  }

  @override
  Future<void> deleteAllLocations() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Location');
  }

  @override
  Future<void> deleteLocationByCityId(int cityId) async {
    await _queryAdapter.queryNoReturn('DELETE FROM Location WHERE cityId = ?',
        arguments: <dynamic>[cityId]);
  }

  @override
  Future<void> insertLocation(Location location) async {
    await _locationInsertionAdapter.insert(
        location, sqflite.ConflictAlgorithm.abort);
  }
}
