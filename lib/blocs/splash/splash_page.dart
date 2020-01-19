import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key key, @required this.logo}) : super(key: key);

  /// Splash Page Tag Name
  static String tag = 'splash-page';

  /// Splash Logo
  final String logo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(child: Image.asset(logo, width: 170.0)),
    ));
  }
}
