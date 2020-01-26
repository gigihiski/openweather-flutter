import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'dart:math' as math;

import 'package:weatherforecast/utilities/app_color.dart' as Theme;

class OWBookmarkList extends StatelessWidget {
  OWBookmarkList(
      {@required this.icon,
      @required this.location,
      @required this.temperature,
      @required this.humidity,
      @required this.speed,
      @required this.degree});

  final String icon;
  final String location;
  final double temperature;
  final double humidity;
  final double speed;
  final double degree;

  EdgeInsets margin = EdgeInsets.only(bottom: 10.0);
  Color color = Theme.AppColor.positiveGreen[900];

  @override
  Widget build(BuildContext context) {
    var compassIcon = Transform.rotate(
        angle: degree * math.pi / 180,
        child: Image.asset("assets/images/compass_icon.png", width: 40.0));

    var waterIcon = Container(
        child: Image.asset("assets/images/water_icon.png", width: 13.0),
        padding: EdgeInsets.all(5.0));

    return Container(
      height: 100.0,
      decoration: BoxDecoration(
        color: Theme.AppColor.positiveGreen[50],
        border: Border.all(color: Theme.AppColor.positiveGreen[50], width: 1),
        borderRadius: BorderRadius.circular(5.0),
      ),
      margin: margin,
      child: Row(
        children: <Widget>[
          Container(
              width: 100.0,
              decoration: BoxDecoration(
                color: Theme.AppColor.positiveGreen[900],
                border: Border.all(
                    color: Theme.AppColor.positiveGreen[900], width: 1),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(bottom: 10.0),
                      child: CachedNetworkImage(
                        imageUrl: icon,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            Icon(Icons.error),
                      ),
                      width: 30.0),
                  Container(
                      child: Text("${temperature.toStringAsFixed(0)}\u00B0C",
                          style: TextStyle(color: Colors.white)))
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              )),
          Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(child: Container(
                                child: Text(location,
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold)))),
                            compassIcon
                          ])),
                  Container(
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(children: <Widget>[
                              waterIcon,
                              Text("${humidity.toStringAsFixed(0)} %")
                            ]),
                            Text("${speed.toStringAsFixed(0)} m/s")
                          ])),
                ]),
          )
        ],
      ),
    );
  }
}
