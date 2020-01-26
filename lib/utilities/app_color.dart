/**
 * App Color
 * @description App Theme Color
 */

import 'package:flutter/material.dart';

class AppColor {
  AppColor._(); // this basically makes it so you can instantiate this class
  // Single Color Without Map
  // static const Color freedomRed = const Color(0xFF098EA0);

  static const MaterialColor authenticBlue = MaterialColor(
    _authenticBluePrimaryValue,
    <int, Color>{
      50: Color(0xFFF1F2F4),
      200: Color(0xFFC6CDD4),
      350: Color(0xFF9CA7B4),
      550: Color(0xFF637689),
      900: Color(_authenticBluePrimaryValue),
    },
  );
  static const int _authenticBluePrimaryValue = 0xFF001E3E;

  static const MaterialColor freedomRed = MaterialColor(
    _freedomRedPrimaryValue,
    <int, Color>{
      900: Color(0xE1FF4500),
      1000: Color(_freedomRedPrimaryValue),
    },
  );
  static const int _freedomRedPrimaryValue = 0xFFFF4500;

  static const MaterialColor actionBlue = MaterialColor(
    _actionBluePrimaryValue,
    <int, Color>{
      50: Color(0xFFF1F7FD),
      350: Color(0xFF9FC5F1),
      900: Color(0xFF096BDB),
      1000: Color(_actionBluePrimaryValue),
    },
  );
  static const int _actionBluePrimaryValue = 0xFF0750A4;

  static const MaterialColor bumpyMagenta = MaterialColor(
    _bumpyMagentaPrimaryValue,
    <int, Color>{
      50: Color(0xFFFFF1FF),
      350: Color(0xFFFF9CFC),
      900: Color(0xFFFF00F7),
      1000: Color(_bumpyMagentaPrimaryValue),
    },
  );
  static const int _bumpyMagentaPrimaryValue = 0xFFBF00B9;

  static const MaterialColor positiveGreen = MaterialColor(
    _positiveGreenPrimaryValue,
    <int, Color>{
      50: Color(0xFFF1FAF5),
      350: Color(0xFF9ED9BB),
      900: Color(0xFF069D4F),
      1000: Color(_positiveGreenPrimaryValue),
    },
  );
  static const int _positiveGreenPrimaryValue = 0xFF05763B;

  static const MaterialColor attentionYellow = MaterialColor(
    _attentionYellowValue,
    <int, Color>{
      50: Color(0xFFFFFCF1),
      350: Color(0xFFFFEB9C),
      900: Color(_attentionYellowValue),
    },
  );
  static const int _attentionYellowValue = 0xFFFFCC00;

  static const MaterialColor negativeOrange = MaterialColor(
    _negativeOrangePrimaryValue,
    <int, Color>{
      50: Color(0xFFFFF6F1),
      350: Color(0xFFFFC09E),
      900: Color(0xFFFF5E05),
      1000: Color(_negativeOrangePrimaryValue),
    },
  );
  static const int _negativeOrangePrimaryValue = 0xFFBF4704;
}
