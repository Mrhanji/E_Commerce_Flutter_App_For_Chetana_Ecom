import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping/Module/Categorylist.dart';

import 'package:shopping/Module/Drawer.dart';
import 'package:shopping/Module/HomeSlider.dart';
import 'package:shopping/Module/NewArivels.dart';

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

        // appBar: AppBar(
        //     systemOverlayStyle:
        //         SystemUiOverlayStyle(statusBarColor: Colors.red),
        //     backwardsCompatibility: false,
        //     automaticallyImplyLeading: false,
        //     elevation: 0,
        //     backgroundColor: Colors.white,
        //     primary: true,
        //     excludeHeaderSemantics: false,

        //     ),
        drawer: DrawerS(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //AppBar
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        icon: Icon(
                          CupertinoIcons.list_bullet,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          _scaffoldkey.currentState.openDrawer();
                        }),
                    Container(
                      child: Image.asset(
                        'assets/logo-dark.png',
                        height: size.height * 0.194,
                      ),
                      width: size.width * 0.6,
                      // height: size.height * 0.19,
                    ),
                    IconButton(
                        icon: Icon(
                          CupertinoIcons.bell,
                          color: Colors.black,
                        ),
                        onPressed: null)
                  ],
                ),
              ),
              //Slider
              Padding(
                padding: const EdgeInsets.only(left:8.0,right: 8),
                child: Container(
                   // color: Colors.red,
                    height: size.height * 0.3,
                    child: HomeSlider()),
              ),
                  
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(height: size.height*0.052,width: size.width,
                      child: Categorylist(),
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween, children: [
                        Text('New Arrivels',style: GoogleFonts.ubuntu(fontSize: size.height*0.023,fontWeight: FontWeight.w600),),
                        Text('See All',style: TextStyle(color: Colors.grey),)
                      ],),
                    ),
                  ),

 Padding(
   padding: const EdgeInsets.all(8.0),
   child: Container(height: size.height*0.2,width: size.width,
     child: NewArivels(),
     
   ),
 )


            ],
          ),
        ),
      ),
    );
  }
}
