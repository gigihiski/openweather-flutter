import 'package:weatherforecast/providers/bookmark_provider.dart';
import 'package:weatherforecast/models/bookmark.dart';

class BookmarkRepository {
  BookmarkAPIProvider _apiProvider = BookmarkAPIProvider();

  // Get List of Bookmark
  Future<List<Bookmark>> getBookmarks() async {
    return _apiProvider.getBookmarks();
  }
}
