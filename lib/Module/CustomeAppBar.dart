import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomeAppBar extends StatefulWidget {
  const CustomeAppBar({Key key}) : super(key: key);

  @override
  _AppBarState createState() => _AppBarState();
}

class _AppBarState extends State<AppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          IconButton(
              icon: Icon(CupertinoIcons.calendar),
              onPressed: () {}),
              Image.asset('assets/logo-dark.png'),
              IconButton(icon: Icon(CupertinoIcons.bell), onPressed: null)
        ],
      ),
    );
  }
}
