import 'package:weatherforecast/models/bookmark.dart';

class BookmarkAPIProvider {
  Future<List<Bookmark>> getBookmarks() async {
    try {
      List<Bookmark> bookmarks = List<Bookmark>();
      bookmarks.add(Bookmark(
          locationName: "Surabaya",
          windSpeed: 20,
          windDegree: 30,
          humidity: 1,
          temperature: 25,
          iconUrl: ""));
      bookmarks.add(Bookmark(
          locationName: "Yogyakarta",
          windSpeed: 10,
          windDegree: 10,
          humidity: 2,
          temperature: 22,
          iconUrl: ""));
      bookmarks.add(Bookmark(
          locationName: "Bandung",
          windSpeed: 25,
          windDegree: 20,
          humidity: 3,
          temperature: 27,
          iconUrl: ""));
      bookmarks.add(Bookmark(
          locationName: "Jakarta",
          windSpeed: 15,
          windDegree: 50,
          humidity: 4,
          temperature: 23,
          iconUrl: ""));

      return bookmarks;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }
}
