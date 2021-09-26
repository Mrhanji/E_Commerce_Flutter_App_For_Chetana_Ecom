import 'package:flutter/material.dart';

class NewArivels extends StatefulWidget {
  const NewArivels({Key key}) : super(key: key);

  @override
  _NewArivelsState createState() => _NewArivelsState();
}

class _NewArivelsState extends State<NewArivels> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      child: ListView(
        scrollDirection: Axis.horizontal,
        // shrinkWrap: true,
     //   itemExtent: 120,
        children: [
          Container(
            width: size.width*0.4,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey),
                color: Colors.blueGrey),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Chip(label: Text('40% OFF',style: TextStyle(color: Colors.white),),backgroundColor: Colors.red,)
                ],),
          
          ),
        


         Container(
            width: size.width*0.4,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey),
                color: Colors.red[100]),
                child: Column(children: [
                  Chip(label: Text('40% OFF',style: TextStyle(color: Colors.white),),backgroundColor: Colors.red,)
                ],),
          
          ),
        ],
      ),
    );
  }
}
