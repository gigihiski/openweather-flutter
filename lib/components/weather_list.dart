import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weatherforecast/components/weather_component.dart';

import 'package:weatherforecast/utilities/app_color.dart' as AppTheme;

class OWWeatherList extends StatelessWidget {
  OWWeatherList();

  EdgeInsets margin = EdgeInsets.only(top: 10.0);
  EdgeInsets padding = EdgeInsets.all(5.0);
  Color color = AppTheme.AppColor.positiveGreen[900];

  @override
  Widget build(BuildContext context) {
    OWWeatherComponent tempComponent =
        OWWeatherComponent(title: "Temperature", value: "30\u00B0C");
    OWWeatherComponent humidityComponent =
        OWWeatherComponent(title: "Humidity", value: "68%");
    OWWeatherComponent rainChancesComponent =
        OWWeatherComponent(title: "Rain Chances", value: "68%");
    OWWeatherComponent windSpeedComponent =
        OWWeatherComponent(title: "Wind Speed", value: "1 m/s");

    return Container(
      decoration: BoxDecoration(
        color: AppTheme.AppColor.positiveGreen[900],
        border:
            Border.all(color: AppTheme.AppColor.positiveGreen[900], width: 1),
        borderRadius: BorderRadius.circular(5.0),
      ),
      margin: margin,
      padding: padding,
      child: Column(
        children: <Widget>[
          Container(
              child: Text("15 Jan 2020 11:00",
                  style: TextStyle(color: Colors.white)),
              alignment: Alignment.centerLeft),
          Container(
              margin: EdgeInsets.only(top: 5.0),
              child: Row(children: <Widget>[
                Expanded(
                  child: tempComponent,
                ),
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
