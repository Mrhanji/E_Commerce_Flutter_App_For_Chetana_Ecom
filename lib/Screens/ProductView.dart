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
    print(widget.data);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          // ignore: deprecated_member_use
          appBar: AppBar(backwardsCompatibility: true,
        title: Text(''),
      )),
    );
  }
}
