import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:shopping/Screens/ProductView.dart';
import 'package:shopping/Utils/config.dart';

class NewArivels extends StatefulWidget {
  const NewArivels({Key key}) : super(key: key);

  @override
  _NewArivelsState createState() => _NewArivelsState();
}

class _NewArivelsState extends State<NewArivels> {
  List product;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetProduct();
  }

  GetProduct() async {
    await http.get(api + 'products.php').then((value) {
         
              setState(() {
                product = jsonDecode(value.body);
               
              });
            
        
        });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      child: ListView(
        scrollDirection: Axis.horizontal,
        // shrinkWrap: true,
      
        children: product!=null?product.map((e) {

         return Padding(
           padding: const EdgeInsets.only(left:8.0),
           child: InkWell(
          
              onTap:()=> Navigator.push(context,MaterialPageRoute(builder: (context)=>ProductView(data: product))),
             child: Container(  
                  width: size.width * 0.4,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                            e['name'],
                              style: TextStyle(fontWeight: FontWeight.w500),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: '\₹ '+e["sale_price"]+'/ ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600)),
                                  TextSpan(
                                    text: '\₹'+e["mrp"],
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      decoration: TextDecoration.lineThrough,
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
        
        }).toList():[Center(child: Lottie.asset('assets/animations/loading.json'),)]
        
        
      ),
    );
  }
}
