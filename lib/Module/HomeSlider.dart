import 'dart:convert';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
    var data = http.get(api).then((value) => {
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

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // return Carousel(
    //     images: b != null
    //         ? b.map((e) {
    //             return Card(child: FadeInImage(placeholder: AssetImage('assets/logo-dark.png'),
    //               image:NetworkImage(e['download_url'])),shadowColor: Colors.grey,elevation: 8,);
    //           }).toList()
    //         : [CircularProgressIndicator()],
    //      boxFit: BoxFit.fill,
    //         dotBgColor: Colors.transparent,
    //         dotSize: 0,

    //         );

    return Carousel(
      boxFit: BoxFit.fill,
            dotBgColor: Colors.transparent,
            dotSize: 0,
      images: [
        Image.network(
            'https://image.freepik.com/free-vector/up-30-off-sale-banner-promotion_3482-1583.jpg',fit: BoxFit.fill,)
      ],
    );
  }
}
