import 'package:flutter/material.dart';

class Categorylist extends StatefulWidget {
  const Categorylist({Key key}) : super(key: key);

  @override
  _CategorylistState createState() => _CategorylistState();
}

class _CategorylistState extends State<Categorylist> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      child: ListView(scrollDirection: Axis.horizontal,
     // shrinkWrap: true,
      itemExtent: 120,
        children: [
        




Container(
            alignment: Alignment.center,
                    
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.grey),color: Colors.blueGrey ),
            child: Chip(
              label: Text(
                'Pants',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: size.height*0.020,
                
                ),
              ),
              backgroundColor: Colors.blueGrey,
            ),
          ),

 




Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(1),
        
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.grey)),
            child: Chip(
              label: Text(
                'Pants',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: size.height*0.020,
                
                ),
              ),
              backgroundColor: Colors.white,
            ),
          ),







          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(1),
       
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.grey)),
            child: Chip(
              label: Text(
                'Pants',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: size.height*0.020,
                
                ),
              ),
              backgroundColor: Colors.white,
            ),
          ),









          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(1),
           
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.grey)),
            child: Chip(
              label: Text(
                'Pants',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: size.height*0.020,
                
                ),
              ),
              backgroundColor: Colors.white,
            ),
          ),














          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(1),
          
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.grey)),
            child: Chip(
              label: Text(
                'Pants',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: size.height*0.020,
                
                ),
              ),
              backgroundColor: Colors.white,
            ),
          ),













          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(1),
           // height: size.height * 0.01,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.grey)),
            child: Chip(
              label: Text(
                'Pants',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: size.height*0.020,
                
                ),
              ),
              backgroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
