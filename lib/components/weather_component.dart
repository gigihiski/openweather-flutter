import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:weatherforecast/utilities/app_color.dart' as AppTheme;

class OWWeatherComponent extends StatelessWidget {
  OWWeatherComponent({this.title, this.value});

  final String title;
  final String value;

  EdgeInsets margin;
  Color color = AppTheme.AppColor.positiveGreen[900];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        children: <Widget>[
          Text(title, style: TextStyle(fontSize: 10.0, color: Colors.white)),
          Text(value,
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white))
        ],
      ),
    );
  }
}
