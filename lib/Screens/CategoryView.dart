import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shopping/Screens/CategoryProducts.dart';
import 'package:shopping/Screens/ProductView.dart';
import 'package:http/http.dart' as http;
import 'package:shopping/Utils/config.dart';

class CategoryView extends StatefulWidget {
  var id, image, name, info;
  CategoryView({Key key, @required this.image, this.name, this.id, this.info})
      : super(key: key);

  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  List category;
 var notfound=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Getitem();
  }

  Getitem() async {
    final Map<String, dynamic> data = {"cid": widget.id};
    final datas = jsonEncode(data);
    await http
        .post(api + 'sub_category.php',
            headers: {'Accept': 'application/json'}, body: datas)
        .then((value) {
      if (value.contentLength > 45) {
        setState(() {
          category = jsonDecode(value.body);
        });
      } else {
        setState(() {
          notfound = true;
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
          body: ListView(
              padding: EdgeInsets.only(left: 4, right: 4, top: 15),
              children: category != null
                  ? category.map((e) {
                      return ListTile(
                        title: Text(e['subcategory_name']),
                        leading: Image.network(widget.image),
                        trailing: Icon(Icons.chevron_right_rounded),
                        onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryProducts(image: widget.image,id: e['id'],name: e['subcategory_name'],))),
                      );
                    }).toList()
                  : [
                      Center(
                        child: Lottie.asset(notfound==false?'assets/animations/loading.json':'assets/animations/empty-category.json'),
                      )
                    ]),
        ),
      ),
    );
  }
}
