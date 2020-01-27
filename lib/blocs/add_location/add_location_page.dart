import 'dart:async';

/**
 * Add Location Page
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherforecast/blocs/add_location/add_location_bloc.dart';
import 'package:weatherforecast/blocs/add_location/add_location_event.dart';
import 'package:weatherforecast/blocs/add_location/add_location_state.dart';
import 'package:weatherforecast/blocs/bookmarked_location/bookmarked_location_page.dart';

// Components
import 'package:weatherforecast/components/app_bar.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weatherforecast/components/bookmark_button.dart';

class AddLocationPage extends StatelessWidget {
  static String tag = 'add_location-activity';

  AddLocationPage({Key key}) : super(key: key);

  var customAppBar = OWAppBar(title: "Add Location");
  Set<Marker> _markers = Set();
  OWBookmarkButton bookmarkButton = OWBookmarkButton(title: "Bookmark");
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    //ignore: close_sinks
    final AddLocationBloc _addLocationBloc =
        BlocProvider.of<AddLocationBloc>(context)..add(GetCurrentLocation());

    return Scaffold(
        appBar: customAppBar,
        body: BlocListener<AddLocationBloc, AddLocationState>(
            listener: (context, state) {
              if (state is AddLocationCreated) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          BookmarkedLocationPage(title: "Locations")),
                );
              }
            },
            child: BlocBuilder<AddLocationBloc, AddLocationState>(
                bloc: _addLocationBloc,
                builder: (context, state) {
                  if (state is LocationUpdated) {
                    return Stack(children: <Widget>[
                      GoogleMap(
                        markers: _markers,
                        myLocationButtonEnabled: true,
                        myLocationEnabled: true,
                        mapType: MapType.normal,
                        initialCameraPosition: CameraPosition(
                          target: LatLng(state.position.latitude,
                              state.position.longitude),
                          zoom: 16,
                        ),
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                        },
                        onTap: (LatLng position) {
                          _addLocationBloc.add(MapMarkerClicked());
                          BlocProvider.of<AddLocationBloc>(context).add(
                            MapLongPressed(
                                markers: _markers,
                                latitude: position.latitude,
                                longitude: position.longitude),
                          );

                          /// Bookmark Button Preparation
                          bookmarkButton.onPressed = () {
                            BlocProvider.of<AddLocationBloc>(context).add(
                              AddNewLocation(
                                  latitude: position.latitude,
                                  longitude: position.longitude),
                            );
                          };
                        },
                      ),
                      Visibility(
                          child: Positioned(
                            child: Align(
                              alignment: FractionalOffset.bottomCenter,
                              child: bookmarkButton,
                            ),
                          ),
                          visible: state.bookmarkVisibility ?? false),
                    ]);
                  }
                  return Center(child: CircularProgressIndicator());
                })));
  }
}
