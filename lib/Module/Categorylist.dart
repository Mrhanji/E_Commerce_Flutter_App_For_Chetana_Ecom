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
      setState(() {
        cat = jsonDecode(value.body);
        print(cat);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      child: ListView(
        // shrinkWrap: true,
        scrollDirection: Axis.horizontal,

        children: cat != null
            ? cat.map((e) {
               return Padding(
                 padding: EdgeInsets.only(right: 8,left: 8),
                 child: Container(
                 
                   color: Colors.red,
                   width: size.width*0.2,
                    child: Column(
                      children: [
                        Image.network(e['category_image'].toString()),
                        Text(e['category_name'])
                      ],
                    ),
                  ),
               );
              }).toList()
            : [CircularProgressIndicator()],
      ),
    );
  }
}
