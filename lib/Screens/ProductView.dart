import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shopping/Utils/config.dart';

class ProductView extends StatefulWidget {
  var data;
  ProductView({Key key, @required this.data}) : super(key: key);

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
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
           Map  t = jsonDecode(value.body);
          print(t['images']);
          // src = temp['Images'];
          // name = temp['name'];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          // ignore: deprecated_member_use
          appBar: AppBar(
        actions: [
          IconButton(
              onPressed: null, icon: Icon(Icons.favorite_border_rounded)),
          IconButton(onPressed: null, icon: Icon(Icons.shopping_cart_rounded)),
        ],
        title: Text(name.toString()),
      )),
    );
  }
}
