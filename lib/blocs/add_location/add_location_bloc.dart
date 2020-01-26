/**
 * AddLocationBloc
*/
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weatherforecast/blocs/add_location/add_location_event.dart';
import 'package:weatherforecast/blocs/add_location/add_location_state.dart';
import 'package:weatherforecast/models/place_info.dart';

import 'package:weatherforecast/repositories/bookmark_repository.dart';
import 'package:weatherforecast/repositories/weather_repository.dart';

class AddLocationBloc extends Bloc<AddLocationEvent, AddLocationState> {
  AddLocationBloc();

  @override
  AddLocationState get initialState => AddLocationUninitialized();

  @override
  Stream<AddLocationState> mapEventToState(AddLocationEvent event) async* {

    if (event is AddNewLocation) {
      BookmarkRepository bookmarkRepository = BookmarkRepository();
      WeatherRepository weatherRepository = WeatherRepository();

      yield AddLocationProcessing();

      try {
        PlaceInfo placeInfo = await weatherRepository.retrievePlaceInformation(
            event.latitude, event.longitude);
        await bookmarkRepository.createBookmark(placeInfo);
        yield AddLocationCreated();
      } catch (error) {
        yield AddLocationFailure(error: error.toString());
      }
    } else if (event is GetCurrentLocation) {
      yield LocationSearching();

      try {
        Position currentLocation = await _getCurrentLocation();
        yield LocationUpdated(position: currentLocation);
      } catch (error) {
        yield LocationUpdateFailure(error: error.toString());
      }
    } else if (event is GetCurrentLocation) {
      yield LocationSearching();

      try {
        Position currentLocation = await _getCurrentLocation();
        yield LocationUpdated(position: currentLocation);
      } catch (error) {
        yield LocationUpdateFailure(error: error.toString());
      }
    } else if (event is MapLongPressed) {
      if (event.markers.length >= 1) {
        event.markers.clear();
      }

      /// Add Markers
      event.markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(LatLng(event.latitude, event.longitude).toString()),
        position: LatLng(event.latitude, event.longitude),
        infoWindow: InfoWindow(
          title: 'Hey, You are Here!',
          snippet: 'Click Bookmark Button to Save Your Location',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));

      Position currentLocation = await _getCurrentLocation();
      yield LocationUpdated(
          position: currentLocation,
          markers: event.markers,
          bookmarkVisibility: true);
    }
  }

  Future<Position> _getCurrentLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
    return geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) async {
      return position;
    }).catchError((e) {
      return null;
    });
  }
}
