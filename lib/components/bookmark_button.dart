import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

class OWBookmarkButton extends StatelessWidget {
  /// Button Title
  final String title;
  VoidCallback onPressed;

  OWBookmarkButton({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: MaterialButton(
            color: Theme.of(context).primaryColor,
            child: Text(title ?? "",
                style: TextStyle(color: Colors.white, fontSize: 15.0)),
            onPressed: onPressed),
        margin: EdgeInsets.only(bottom: 50.0));
  }
}
