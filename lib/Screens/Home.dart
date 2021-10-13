import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping/Module/Categorylist.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shopping/Module/Drawer.dart';
import 'package:shopping/Module/HomeSlider.dart';
import 'package:shopping/Module/NewArivels.dart';
import 'package:shopping/Module/Sale.dart';
import 'package:shopping/Utils/config.dart';
import 'package:shopping/main.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //var systemUiOverlayStyle = SystemUiOverlayStyle;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldkey,

        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              icon: Icon(
                CupertinoIcons.list_bullet_below_rectangle,
                color: Colors.black,
              ),
              onPressed: () {
                _scaffoldkey.currentState.openDrawer();
              }),

              centerTitle: true,
              title: Text(appname,style: GoogleFonts.acme(color: Colors.black,fontSize: size.height*0.024),),
              actions: [
                IconButton(
                        icon: Icon(
                          CupertinoIcons.bell,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          _scaffoldkey.currentState.openDrawer();
                        }),
              ],
        ),
        drawer: DrawerS(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //AppBar

              //Slider
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: Container(
                    // color: Colors.red,
                    height: size.height * 0.3,
                    child: HomeSlider()),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: size.height * 0.052,
                  width: size.width,
                  child: Categorylist(),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'New Arrivels',
                        style: GoogleFonts.ubuntu(
                            fontSize: size.height * 0.023,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'See All',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: size.height * 0.2,
                  width: size.width,
                  child: NewArivels(),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sale',
                        style: GoogleFonts.ubuntu(
                            fontSize: size.height * 0.023,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'See All',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
              ),
              //Sale
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: Container(
                  width: size.width,
                  height: size.height * 0.4,
                  child: Sale(),
                ),
              )
            ],
          ),
        ),

        extendBody: true, //<------like this
        bottomNavigationBar: DotNavigationBar(
          currentIndex: 0,
          onTap: (i) {
            print(i);
          },
          backgroundColor: HexColor('#ecd0a6'),
          dotIndicatorColor: Colors.black,
          enableFloatingNavBar: true,
          items: [
            /// Home
            
            DotNavigationBarItem(
              icon: Icon(Icons.home,),
              selectedColor: Colors.purple,
            ),

            /// Cart
            DotNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              selectedColor: Colors.pink,
            ),

            /// Search
            DotNavigationBarItem(
              icon: Icon(Icons.search),
              selectedColor: Colors.orange,
            ),

            /// Likes
            ///
            DotNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              selectedColor: Colors.pink,
            ),

            // /// Profile
            // DotNavigationBarItem(
            //   icon: Icon(Icons.person),
            //   selectedColor: Colors.teal,
            // ),
          ],
        ),
      ),
    );
  }
}
