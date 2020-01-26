import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class AddLocationEvent extends Equatable {
  const AddLocationEvent();

  @override
  List<Object> get props => [];
}

class AddNewLocation extends AddLocationEvent {
  /// Latitude
  final double latitude;

  /// Longitude
  final double longitude;

  const AddNewLocation({this.latitude, this.longitude});

  @override
  List<Object> get props => [latitude, longitude];

  @override
  String toString() =>
      'AddNewLocation { latitude: $latitude, longitude: $longitude }';
}

class GetCurrentLocation extends AddLocationEvent {
  /// Latitude
  final double latitude;

  /// Longitude
  final double longitude;

  const GetCurrentLocation({this.latitude, this.longitude});

  @override
  List<Object> get props => [latitude, longitude];

  @override
  String toString() =>
      'GetCurrentLocation { latitude: $latitude, longitude: $longitude }';
}

class MapLongPressed extends AddLocationEvent {
  /// Markers
  final Set<Marker> markers;

  /// Latitude
  final double latitude;

  /// Longitude
  final double longitude;

  const MapLongPressed({this.markers, this.latitude, this.longitude});

  @override
  List<Object> get props => [markers, latitude, longitude];

  @override
  String toString() =>
      'MapLongPressed { markers: $markers, latitude: $latitude, longitude: $longitude }';
}

class BookmarkButtonHide extends AddLocationEvent {
  const BookmarkButtonHide();
}

class MapMarkerClicked extends AddLocationEvent {
  const MapMarkerClicked();
}
