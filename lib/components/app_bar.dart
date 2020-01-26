import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:meta/meta.dart';

class OWAppBar extends StatelessWidget with PreferredSizeWidget {
  /// App Bar Title
  String title;

  /// App Bar Left Menu Widget
  Widget leading;

  /// App Bar Right Menu Widgets
  List<Widget> actions;

  OWAppBar({@required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      centerTitle: true,
      title: Text(title),
      leading: leading,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
