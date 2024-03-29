import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shopping/Screens/ProductView.dart';
import 'package:http/http.dart' as http;
import 'package:shopping/Utils/config.dart';

class CategoryProducts extends StatefulWidget {
  var id, image, name;
  CategoryProducts({Key key, @required this.image, this.name, this.id})
      : super(key: key);

  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryProducts> {
  List product;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Getitem();
  }

  Getitem() async {
    await http.get(api + 'products.php').then((value) {
      setState(() {
        product = jsonDecode(value.body);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: 200.0,
                backgroundColor: Colors.deepOrange,
                floating: true,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(widget.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        )),
                    stretchModes: [StretchMode.blurBackground],
                    background: Image.network(
                      widget.image,
                      fit: BoxFit.cover,
                    )),
              ),
            ];
          },
          body: SafeArea(top: true,
            child: GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.only(left: 4,right: 4,top:15),
                crossAxisSpacing: 15,
                mainAxisSpacing: 10,
                children: product != null
                    ? product.map((e) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ProductView(data: e['id']))),
                            child: Container(
                                width: size.width * 0.1,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    // border: Border.all(color: Colors.grey),
                                    color: Colors.blueGrey[100]),
                                child: Stack(
                                  children: [
                                    Positioned(
                                        top: 2,
                                        left: 2,
                                        right: 0,
                                        child: Container(
                                            height: size.height * 0.15,
                                            width: size.width,
                                            child: Image.network(
                                              e['path'].toString(),
                                              fit: BoxFit.contain,
                                            ))),
                                    Positioned(
                                      bottom: 5,
                                      left: 6,
                                      right: 0,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            e['name'],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                    text: '\₹ ' +
                                                        e["sale_price"] +
                                                        '/ ',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                TextSpan(
                                                  text: '\₹' + e["mrp"],
                                                  style: TextStyle(
                                                    color: Colors.grey[600],
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                        top: 1,
                                        left: 3,
                                        child: Chip(
                                          label: Text(
                                            e['badge'],
                                            style: TextStyle(color: Colors.white),
                                          ),
                                          backgroundColor: Colors.red,
                                        )),
                                  ],
                                )),
                          ),
                        );
                      }).toList()
                    : [
                        Center(
                          child: Lottie.asset('assets/animations/loading.json'),
                        )
                      ]),
          ),
        ),
      ),
    );
  }
}
