import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:weatherforecast/blocs/bookmarked_location/bookmarked_location_bloc.dart';
import 'package:weatherforecast/blocs/bookmarked_location/bookmarked_location_event.dart';
import 'package:weatherforecast/blocs/bookmarked_location/bookmarked_location_state.dart';
import 'package:weatherforecast/blocs/help/help_page.dart';
import 'package:weatherforecast/blocs/weather_detail/weather_detail_page.dart';
import 'package:weatherforecast/blocs/add_location/add_location_page.dart';
import 'package:weatherforecast/components/app_bar.dart';
import 'package:weatherforecast/components/bookmark_list.dart';
import 'package:weatherforecast/models/place_info.dart';
import 'package:weatherforecast/models/weather.dart';

class BookmarkedLocationPage extends StatelessWidget {
  BookmarkedLocationPage({Key key, @required this.title}) : super(key: key);

  /// Bookmark Location Page Tag Name
  static String tag = 'bookmark-page';

  /// Page Title
  final String title;

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    //ignore: close_sinks
    final BookmarkedLocationBloc _bookmarkedLocationBloc =
        BlocProvider.of<BookmarkedLocationBloc>(context)..add(Fetch());

    /// Custom App Bar
    OWAppBar customAppBar = OWAppBar(title: title);
    customAppBar.leading = IconButton(
        icon: const Icon(Icons.bookmark),
        tooltip: 'Bookmark',
        onPressed: () {
          Navigator.of(context).pushNamed(HelpPage.tag);
        });
    customAppBar.actions = <Widget>[
      IconButton(
          icon: Icon(Icons.add),
          tooltip: 'Add Location',
          onPressed: () {
            Navigator.of(context).pushNamed(AddLocationPage.tag);
          })
    ];

    return Scaffold(
        appBar: customAppBar,
        body: Container(
          height: double.infinity,
          padding: EdgeInsets.all(10.0),
          child: BlocBuilder<BookmarkedLocationBloc, BookmarkedLocationState>(
            bloc: _bookmarkedLocationBloc,
            builder: (context, state) {
              if (state is BookmarkedLocationUninitialized ||
                  state is BookmarkedLocationFetching) {
                return Center(child: CircularProgressIndicator());
              } else if (state is BookmarkedLocationFetched) {
                return _buildBookmarkedLocationWidget(
                    context, _bookmarkedLocationBloc, state.bookmarks, state);
              }
              return Center(
                  child: Container(
                      margin: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Text(
                          "You don't have saved location yet, please tap + icon to add new location",
                          style: TextStyle(fontSize: 16, color: Colors.grey))));
            },
          ),
        ));
  }

  Widget _buildBookmarkedLocationWidget(
      BuildContext context,
      BookmarkedLocationBloc bloc,
      List<AggregatedWeatherInfo> bookmarks,
      BookmarkedLocationState state) {
    return SmartRefresher(
        controller: _refreshController,
        onRefresh: () async {
          /// Refesh
          bloc.add(Fetch());
          if (state is BookmarkedLocationFetched) {
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text("Weather Information Updated")));
            _refreshController.refreshCompleted();
          } else {
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text("Failed to Refresh")));
            _refreshController.refreshFailed();
          }
        },
        enablePullDown: true,
        enablePullUp: true,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: bookmarks.length,
          itemBuilder: (BuildContext context, int index) {
            AggregatedWeatherInfo bookmark = bookmarks[index];

            return Dismissible(
              key: Key(bookmark.cityId.toString()),
              onDismissed: (direction) {
                bloc.add(RemoveBookmarkedItem(cityId: bookmark.cityId));
                Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("${bookmark.cityName} has been Removed")));
              },
              background: Container(color: Colors.red),
              child: GestureDetector(
                  child: OWBookmarkList(
                      icon: bookmark.weathers[0].iconURL,
                      location: bookmark.cityName,
                      temperature: bookmark.mainInfo.temperature,
                      humidity: bookmark.mainInfo.humidity,
                      speed: bookmark.wind.speed,
                      degree: bookmark.wind.degree),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WeatherDetailPage(
                              title: "Today's Weather",
                              placeInfo: PlaceInfo(
                                  identifier: bookmark.cityId,
                                  name: bookmark.cityName))),
                    );
                  }),
            );
          },
        ));
  }
}
