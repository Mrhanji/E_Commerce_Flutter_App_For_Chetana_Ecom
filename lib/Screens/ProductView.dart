import 'package:flutter/material.dart';

class ProductView extends StatefulWidget {
  var data;
  ProductView({Key key, @required this.data}) : super(key: key);

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          // ignore: deprecated_member_use
          appBar: AppBar(
          actions: [IconButton(onPressed: null, icon: Icon(Icons.favorite_border_rounded)),
          IconButton(onPressed: null, icon: Icon(Icons.shopping_cart_rounded)),],
        title: Text(''),
      )),
    );
  }
}
