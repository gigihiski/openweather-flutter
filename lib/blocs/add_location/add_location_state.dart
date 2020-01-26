import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

abstract class AddLocationState extends Equatable {
  const AddLocationState();

  @override
  List<Object> get props => [];
}

/// AddLocationUninitialized
/// Init State
class AddLocationUninitialized extends AddLocationState {}

/// AddLocationProcessing
/// Create New Location Data is in Progress
class AddLocationProcessing extends AddLocationState {}

/// AddLocationCreated
/// New Location Data has been Created
class AddLocationCreated extends AddLocationState {
  AddLocationCreated();
}

/// AddLocationFailure
/// Failure State When Creating New Location Data
class AddLocationFailure extends AddLocationState {
  final String error;

  const AddLocationFailure({this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'AddLocationFailure { error: $error }';
}

/// LocationSearching
/// Searching Current Position
class LocationSearching extends AddLocationState {}

/// LocationUpdated
/// Current Location has been Fetched
class LocationUpdated extends AddLocationState {
  final Position position;
  final bool bookmarkVisibility;
  final Set<Marker> markers;

  LocationUpdated({@required this.position, this.markers, this.bookmarkVisibility})
      : assert(position != null);

  @override
  List<Object> get props => [position, markers, bookmarkVisibility];

  @override
  String toString() =>
      'LocationUpdated { position: $position, markers: $markers, bookmarkVisibility: $bookmarkVisibility }';
}

/// LocationUpdated
/// Current Location has been Fetched
class LocationUpdateFailure extends AddLocationState {
  final String error;

  const LocationUpdateFailure({this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LocationUpdateFailure { error: $error }';
}

/// BookmarkButtonShow
/// Bookmark Button Show Status
class BookmarkButtonShow extends AddLocationState {
  final bool visibility;

  const BookmarkButtonShow({this.visibility});

  @override
  List<Object> get props => [visibility];

  @override
  String toString() => 'BookmarkButtonShow { visibility: $visibility }';
}
