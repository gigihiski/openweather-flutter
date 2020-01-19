import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:weatherforecast/models/bookmark.dart';

abstract class BookmarkedLocationState extends Equatable {
  const BookmarkedLocationState();

  @override
  List<Object> get props => [];
}

/// BookmarkedLocationUninitialized
/// Init State
class BookmarkedLocationUninitialized extends BookmarkedLocationState {}

/// BookmarkedLocationLoading
/// Get Bookmarked Location Data in Progress
class BookmarkedLocationFetching extends BookmarkedLocationState {}

/// BookmarkedLocationFetched
/// Bookmarked Location Data has been Fetched
class BookmarkedLocationFetched extends BookmarkedLocationState {
  final List<Bookmark> bookmarks;

  BookmarkedLocationFetched({@required this.bookmarks}) : assert(bookmarks != null);
}

/// BookmarkedLocationFailure
/// Get Bookmarked Location Data Failure State
class BookmarkedLocationFailure extends BookmarkedLocationState {
  final String error;

  const BookmarkedLocationFailure({this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'BookmarkedLocationFailure { error: $error }';
}

/// BookmarkedLocationEmpty
/// Bookmarked Location Data State if It is Empty
class BookmarkedLocationEmpty extends BookmarkedLocationState {}
