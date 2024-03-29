import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:shopping/Screens/CategoryProducts.dart';
import 'package:shopping/Screens/CategoryView.dart';

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

  void dispose() {
    super.dispose();
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
                  padding: EdgeInsets.only(right: 3, left: 1),
                  child: InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoryView(
                                image: e['category_image'],
                                name: e['category_name'],
                                id: e['id'],
                                info: e['category_info']))),
                    child: Container(
                      width: size.width * 0.25,
                      height: size.height * 0.19,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: AssetImage('assets/bg.jpg'),
                              fit: BoxFit.fill)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: size.height * 0.15,
                            child: FadeInImage(
                                placeholder: AssetImage('assets/logo-dark.png'),
                                image: NetworkImage(
                                    e['category_image'].toString())),
                          ),
                          SizedBox(height: size.height * 0.01),
                          Text(
                            ' ' + e['category_name'],
                            style: TextStyle(fontWeight: FontWeight.w700),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }).toList()
            : [
                Center(
                  child: Lottie.asset('assets/animations/loading.json'),
                )
              ],
      ),
    );
  }
}
