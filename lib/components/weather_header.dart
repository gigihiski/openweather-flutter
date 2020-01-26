import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weatherforecast/components/weather_component.dart';
import 'package:weatherforecast/models/place_info.dart';
import 'package:weatherforecast/models/weather.dart';

import 'package:weatherforecast/utilities/app_color.dart' as AppTheme;

class OWWeatherHeader extends StatelessWidget {
  OWWeatherHeader({@required this.info, this.placeInfo});

  final AggregatedWeatherInfo info;
  final PlaceInfo placeInfo;

  EdgeInsets margin;
  EdgeInsets padding = EdgeInsets.all(10.0);
  Color color = AppTheme.AppColor.positiveGreen[900];

  @override
  Widget build(BuildContext context) {
    OWWeatherComponent tempComponent = OWWeatherComponent(
        title: "Temperature", value: "${info.mainInfo.temperature}\u00B0C");
    OWWeatherComponent humidityComponent = OWWeatherComponent(
        title: "Humidity", value: "${info.mainInfo.humidity}%");
    OWWeatherComponent rainChancesComponent = OWWeatherComponent(
        title: "Rain Chances", value: "${info.cloud.cloudinessPercentage}%");
    OWWeatherComponent windSpeedComponent = OWWeatherComponent(
        title: "Wind Speed", value: "${info.wind.speed} m/s");

    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: AppTheme.AppColor.positiveGreen[900],
        border:
            Border.all(color: AppTheme.AppColor.positiveGreen[900], width: 1),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        children: <Widget>[
          Container(
              child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: AppTheme.AppColor.positiveGreen,
                    border: Border.all(
                        color: AppTheme.AppColor.positiveGreen, width: 1),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  width: double.infinity,
                  child: Column(
                    children: <Widget>[
                      Container(
                          child: Text(placeInfo.name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold))),
                      Container(
                          child: Text(info.weathers[0].condition,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold)),
                          margin: EdgeInsets.only(top: 3.0)),
                      Container(
                          child: CachedNetworkImage(
                            imageUrl: info.weathers[0].iconURL,
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                          width: 50.0),
                    ],
                  ))),
          Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Row(children: <Widget>[
                Expanded(child: tempComponent),
                Expanded(
                  child: humidityComponent,
                ),
                Expanded(
                  child: rainChancesComponent,
                ),
                Expanded(
                  child: windSpeedComponent,
                )
              ]))
        ],
      ),
    );
  }
}
