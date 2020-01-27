/**
 * BookmarkedLocationBloc
*/
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherforecast/blocs/bookmarked_location/bookmarked_location_event.dart';
import 'package:weatherforecast/blocs/bookmarked_location/bookmarked_location_state.dart';
import 'package:weatherforecast/models/weather.dart';

import 'package:weatherforecast/repositories/bookmark_repository.dart';

class BookmarkedLocationBloc
    extends Bloc<BookmarkedLocationEvent, BookmarkedLocationState> {
  BookmarkRepository _bookmarkRepository = BookmarkRepository();

  BookmarkedLocationBloc() {
    this._bookmarkRepository = BookmarkRepository();
  }

  @override
  BookmarkedLocationState get initialState => BookmarkedLocationUninitialized();

  @override
  Stream<BookmarkedLocationState> mapEventToState(
      BookmarkedLocationEvent event) async* {
    if (event is Fetch) {
      yield BookmarkedLocationFetching();

      try {
        List<AggregatedWeatherInfo> bookmarks =
            await this._bookmarkRepository.getBookmarks();
        if (bookmarks.length == 0) {
          yield BookmarkedLocationEmpty();
        } else {
          yield BookmarkedLocationFetched(bookmarks: bookmarks);
        }
      } catch (error) {
        yield BookmarkedLocationFailure(error: error.toString());
      }
    } else if (event is RemoveBookmarkedItem) {
      try {
        await this._bookmarkRepository.removeBookmark(event.cityId);
        List<AggregatedWeatherInfo> bookmarks =
            await this._bookmarkRepository.getBookmarks();
        if (bookmarks.length == 0) {
          yield BookmarkedLocationEmpty();
        } else {
          yield BookmarkedLocationFetched(bookmarks: bookmarks);
        }
      } catch (error) {
        yield BookmarkedLocationFailure(error: error.toString());
      }
    }
  }
}
