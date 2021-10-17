import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
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
              onChanged: (data){
            final Map<String,dynamic> project={
              'name':data.toString()
            };
            var st=jsonEncode(project);
             http.post(api+'search.php',headers: {'Accept':'application/json' },body: st).then((value) {
               if(value.statusCode==200){
                 setState(() {
                   src=jsonDecode(value.body);
                 });
               }
             });

              },
        )),
      ),
      body: ListView(
        children: src!=null?src.map((e) {
          return ListTile(
            title: Text(e['name'],maxLines: 1,overflow: TextOverflow.ellipsis,),
            leading: Container(height:size.height*0.06,width:size.width*0.2,child: Image.network(e['path'])),
            trailing: Icon(Icons.arrow_right),
            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductView(data: e['id'],))),
          );
        }).toList():[]
      ),
      ),
    );
  }
}
