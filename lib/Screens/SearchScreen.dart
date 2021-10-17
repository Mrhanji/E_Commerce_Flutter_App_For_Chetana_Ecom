import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _txt = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData(primaryColor: Colors.white,accentColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Container(color: Colors.white30,
            child: TextField(
          controller: _txt,
          maxLines: 1,
          decoration: InputDecoration(focusColor: Colors.white,
          fillColor: Colors.white,icon: Icon(Icons.search),
          
          ),
        )),
      )),
    );
  }
}
