/**
 * BookmarkedLocationBloc
*/
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:weatherforecast/blocs/bookmarked_location/bookmarked_location_event.dart';
import 'package:weatherforecast/blocs/bookmarked_location/bookmarked_location_state.dart';
import 'package:weatherforecast/models/bookmark.dart';

import 'package:weatherforecast/repositories/bookmark_repository.dart';

class BookmarkedLocationBloc
    extends Bloc<BookmarkedLocationEvent, BookmarkedLocationState> {
  final BookmarkRepository bookmarkRepository;

  BookmarkedLocationBloc({
    @required this.bookmarkRepository,
  }) : assert(bookmarkRepository != null);

  @override
  BookmarkedLocationState get initialState => BookmarkedLocationUninitialized();

  @override
  Stream<BookmarkedLocationState> mapEventToState(
      BookmarkedLocationEvent event) async* {
    if (event is Fetch) {
      yield BookmarkedLocationFetching();

      try {
        List<Bookmark> bookmarks = await bookmarkRepository.getBookmarks();
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
