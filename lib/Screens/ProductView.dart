import 'dart:convert';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shopping/Module/SingleProduct.dart';
import 'package:shopping/Screens/Home.dart';
import 'package:shopping/Utils/config.dart';

class ProductView extends StatefulWidget {
  var data;
  ProductView({Key key, @required this.data}) : super(key: key);

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  SingleProduct singleProduct = SingleProduct();
  List src;
  var name;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.data);
    final Map<String, dynamic> project = {'id': widget.data.toString()};
    var st = jsonEncode(project);

    http
        .post(api + 'single_product.php',
            headers: {'Accept': 'application/json'}, body: st)
        .then((value) {
      if (value.statusCode == 200) {
        setState(() {
          var t = jsonDecode(value.body);
          List st = t[0]['Images'];
          src = st;
          name = t[0]['name'];
          for (var i = 0; st.length > i; i++) {
            print(st[i]['path']);
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // ignore: deprecated_member_use
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.pop(
                  context, MaterialPageRoute(builder: (context) => Home())),
              icon: Icon(
                Icons.chevron_left_rounded,
                color: Colors.black87,
              )),
          actions: [
            IconButton(
                onPressed: null, icon: Icon(Icons.favorite_border_rounded)),
            IconButton(
                onPressed: null, icon: Icon(Icons.shopping_cart_rounded)),
          ],
          title: Text(name.toString()),
        ),
        body: src != null
            ? SingleChildScrollView(
              child: Column(
                
                  children: [
                    Container(
                      height: size.height*0.4,
                      width: size.width,
                      child: Carousel(
                        autoplay: false,
                        dotPosition: DotPosition.bottomRight,
                        dotBgColor: Colors.transparent,
                        dotSize: size.height*0.0051,
                        images: List.generate(src.length, (index) {
                          return Container(decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(src[index]['path']),fit:BoxFit.contain)));
                        }, growable: true),
                      ),
                    ),
                  ],
                ),
            )
            : Center(
                child: Lottie.asset('assets/animations/loading.json'),
              ),
      ),
    );
  }

  void dispose() {
    super.dispose();
  }
}
