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
