import 'package:equatable/equatable.dart';

abstract class BookmarkedLocationEvent extends Equatable {
  const BookmarkedLocationEvent();

  @override
  List<Object> get props => [];
}

class Fetch extends BookmarkedLocationEvent {
  const Fetch();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'Fetch { }';
}

class RemoveBookmarkedItem extends BookmarkedLocationEvent {
  final int cityId;

  const RemoveBookmarkedItem({this.cityId});

  @override
  List<Object> get props => [cityId];

  @override
  String toString() => 'RemoveBookmarkedItem { cityId: $cityId }';
}
