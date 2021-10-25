import 'dart:convert';

import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping/Screens/Home.dart';
import 'package:shopping/Screens/ProductView.dart';
import 'package:shopping/Utils/config.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _txt = TextEditingController();
  List src;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _txt.addListener(() {
      final Map<String, dynamic> project = {'name': _txt.text};
      var st = jsonEncode(project);
      if (_txt.text.isNotEmpty) {
        http
            .post(api + 'search.php',
                headers: {'Accept': 'application/json'}, body: st)
            .then((value) {
          if (value.statusCode == 200) {
            setState(() {
              src = jsonDecode(value.body);
            });
          }
        });
      }
    });
  }

 
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.white, accentColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.pop(
                  context, MaterialPageRoute(builder: (context) => Home())),
              icon: Icon(
                Icons.chevron_left_rounded,
                color: Colors.black87,
              )),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            AnimSearchBar(
                width: size.width,
                textController: _txt,
                rtl: true,
                autoFocus: true,
                closeSearchOnSuffixTap: true,
                color: Colors.blueAccent,
                style: TextStyle(color: Colors.white),
                onSuffixTap: () {
                  _txt.clear();
                })
          ],
        ),
        body: ListView(
            children: src != null
                ? src.map((e) {
                    return ListTile(
                      title: Text(
                        e['name'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      leading: Container(
                          height: size.height * 0.06,
                          width: size.width * 0.2,
                          child: Image.network(e['pic'])),
                      trailing: Icon(Icons.arrow_right),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductView(
                                    data: e['id'],
                                  ))),
                    );
                  }).toList()
                : []),
      ),
    );
  }
   void dispose() {
    super.dispose();
    _txt.dispose();
  }

}
