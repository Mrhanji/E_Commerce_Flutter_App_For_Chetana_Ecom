import 'package:flutter/material.dart';

class Sale extends StatefulWidget {
  const Sale({Key key}) : super(key: key);

  @override
  _SaleState createState() => _SaleState();
}

class _SaleState extends State<Sale> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GridView.count(crossAxisCount: 2,
    mainAxisSpacing: 8,crossAxisSpacing: 8,
    physics: NeverScrollableScrollPhysics(),
      
      children: [
        Container(
            width: size.width * 0.4,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                // border: Border.all(color: Colors.grey),
                color: Colors.yellow[100]),
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
                          'https://www.pngall.com/wp-content/uploads/5/Shirt-PNG-Images.png',
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
                        'Shirt for Men ',
                        style: TextStyle(fontWeight: FontWeight.w500),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: ' \₹300.99 /',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600)),
                            TextSpan(
                              text: '\₹350.99',
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
                        '20% OFF',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.red,
                    )),
              ],
            )),





         ],
    );
  }
}
