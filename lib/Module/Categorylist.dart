import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping/Utils/config.dart';

class Categorylist extends StatefulWidget {
  const Categorylist({Key key}) : super(key: key);

  @override
  _CategorylistState createState() => _CategorylistState();
}

class _CategorylistState extends State<Categorylist> {
  List cat;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Callapi();
  }

  Callapi() async {
    await http.get(api + 'getcategory.php').then((value) {
      cat = jsonDecode(value.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      child: ListView(
        scrollDirection: Axis.horizontal,
        // shrinkWrap: true,

        children: cat != null
            ? cat.map((e) {
                Container(
                  child: Column(
                    children: [Image.network(''), Text('title')],
                  ),
                );
              }).toList()
            : [CircularProgressIndicator()],
      ),
    );
  }
}
