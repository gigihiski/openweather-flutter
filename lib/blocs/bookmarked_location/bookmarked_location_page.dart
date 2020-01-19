import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherforecast/blocs/bookmarked_location/bookmarked_location_bloc.dart';
import 'package:weatherforecast/blocs/bookmarked_location/bookmarked_location_state.dart';
import 'package:weatherforecast/blocs/help/help_page.dart';
import 'package:weatherforecast/components/app_bar.dart';
import 'package:weatherforecast/components/bookmark_list.dart';
import 'package:weatherforecast/models/bookmark.dart';

class BookmarkedLocationPage extends StatelessWidget {
  BookmarkedLocationPage({Key key, @required this.title}) : super(key: key);

  /// Bookmark Location Page Tag Name
  static String tag = 'bookmark-page';

  /// Page Title
  final String title;

  @override
  Widget build(BuildContext context) {
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
        onPressed: () {},
      ),
    ];

    return Scaffold(
        appBar: customAppBar,
        body: Container(
          height: double.infinity,
          padding: EdgeInsets.all(10.0),
          child: BlocBuilder<BookmarkedLocationBloc, BookmarkedLocationState>(
            builder: (context, state) {
              if (state is BookmarkedLocationUninitialized || state is BookmarkedLocationFetching) {
                return Center(child: CircularProgressIndicator());
              } else if (state is BookmarkedLocationFetched) {
                final bookmarkFetchedState = state;
                final bookmars = bookmarkFetchedState.bookmarks;
                return _buildTransactionWidget(bookmars);
              }
              return Container();
            },
          ),
        ));
  }

  Widget _buildTransactionWidget(List<Bookmark> bookmarks) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: bookmarks.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
            child: OWBookmarkList(
                location: bookmarks[index].locationName,
                temperature: bookmarks[index].temperature,
                humidity: bookmarks[index].humidity,
                speed: bookmarks[index].windSpeed,
                degree: bookmarks[index].windDegree),
            onTap: () {});
      },
    );
  }
}
