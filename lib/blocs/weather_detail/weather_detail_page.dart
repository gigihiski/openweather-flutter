import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherforecast/blocs/weather_detail/weather_detail_bloc.dart';
import 'package:weatherforecast/blocs/weather_detail/weather_detail_state.dart';
import 'package:weatherforecast/components/app_bar.dart';
import 'package:weatherforecast/components/weather_header.dart';
import 'package:weatherforecast/components/weather_list.dart';
import 'package:weatherforecast/models/weather.dart';

class WeatherDetailPage extends StatelessWidget {
  WeatherDetailPage({Key key, @required this.title}) : super(key: key);

  /// Bookmark Location Page Tag Name
  static String tag = 'weather_detail-page';

  /// Page Title
  final String title;

  @override
  Widget build(BuildContext context) {
    /// Custom App Bar
    OWAppBar customAppBar = OWAppBar(title: title);
    OWWeatherHeader headerList = OWWeatherHeader();

    return Scaffold(
        appBar: customAppBar,
        body: Container(
          height: double.infinity,
          padding: EdgeInsets.all(10.0),
          child: BlocBuilder<WeatherDetailBloc, WeatherDetailState>(
            builder: (context, state) {
              if (state is WeatherDetailUninitialized ||
                  state is WeatherDetailFetching) {
                return Center(child: CircularProgressIndicator());
              } else if (state is WeatherDetailFetched) {
                final weatherDetailFetchedState = state;
                final infos = weatherDetailFetchedState.infos;
                return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      headerList,
                      Expanded(
                          child:
                              Container(child: _buildWeatherListWidget(infos)))
                    ]);
              }
              return Container();
            },
          ),
        ));
  }

  Widget _buildWeatherListWidget(List<AggregatedWeatherInfo> infos) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: infos.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(child: OWWeatherList());
      },
    );
  }
}
