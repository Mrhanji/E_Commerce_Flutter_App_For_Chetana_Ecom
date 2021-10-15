import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
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
        //print(cat);
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
                 child: Card(
                 
                   //color: Colors.red,
                   
                    child: Container(width: size.width*0.25,
                      child: Column( mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(height: size.height*0.15,
                            child: FadeInImage(placeholder: AssetImage('assets/logo-dark.png'),
                            image:NetworkImage(e['category_image'].toString())),
                          ),
                          Text(e['category_name'],style: TextStyle(fontWeight: FontWeight.w500),maxLines: 1,overflow: TextOverflow.ellipsis,)
                        ],
                      ),
                    ),
                  ),
               );
              }).toList()
            : [Center(child: Lottie.asset('assets/animations/loading.json'),)],
      ),
    );
  }
}
