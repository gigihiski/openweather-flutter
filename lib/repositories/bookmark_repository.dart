import 'package:weatherforecast/models/place_info.dart';
import 'package:weatherforecast/models/weather.dart';
import 'package:weatherforecast/providers/bookmark_provider.dart';

class BookmarkRepository {
  BookmarkAPIProvider _apiProvider = BookmarkAPIProvider();

  // Get List of Bookmark
  Future<List<AggregatedWeatherInfo>> getBookmarks() async {
    return _apiProvider.getBookmarks();
  }

  // Create a Bookmark after Selecting Location on Map
  Future<void> createBookmark(PlaceInfo placeInfo) async {
    return _apiProvider.createBookmark(placeInfo);
  }

  // Remove a Bookmarked Location
  Future<void> removeBookmark(int cityId) async {
    return _apiProvider.removeBookmark(cityId);
  }
}
