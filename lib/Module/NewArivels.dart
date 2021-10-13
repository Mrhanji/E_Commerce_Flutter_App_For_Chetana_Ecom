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
        padding: EdgeInsets.only(right: size.height * 0.05),
        children: [
          Container(
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
                            'https://i.pinimg.com/originals/bd/ef/cb/bdefcbc72735f64db17f3250b1e64245.png',
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
                          'T Shirt for Men ',
                          style: TextStyle(fontWeight: FontWeight.w500),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: ' \₹350.90 /',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600)),
                              TextSpan(
                                text: '\₹300.99',
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
                          '40% OFF',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.red,
                      )),
                ],
              )),
          SizedBox(
            width: size.width * 0.04,
          ),
          
        ],
      ),
    );
  }
}
