import 'dart:convert';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:shopping/Utils/config.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({Key key}) : super(key: key);

  @override
  _HomeSliderState createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  @override
  List b;
  void initState() {
    // TODO: implement initState
    super.initState();
    var data = http.get(api + 'slider.php').then((value) => {
          if (value.statusCode == 200)
            {
              setState(() {
                b = jsonDecode(value.body);
                  print(b);
              })
            }
          else
            {print('error')}
        });
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Carousel(
      images: b != null
          ? b.map((e) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(e['image']), fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(30))),
              );
            }).toList()
          : [
              Center(
                child: Lottie.asset('assets/animations/loading.json'),
              )
            ],
      boxFit: BoxFit.fill,
      dotBgColor: Colors.transparent,
      dotSize: 0,
      overlayShadowSize: 50,
    );
  }
}
