import 'dart:async';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping/Screens/Home.dart';
import 'package:shopping/Utils/shared.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Constants.user = await SharedPreferences.getInstance();

  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

  OneSignal.shared.setAppId("df199b6e-1d13-4c90-bf01-4a89b5df00ea");

  OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
    print("Accepted permission: $accepted");
  });
  //no changes without api link
  runApp(Splash());
}

class SystemUiOverlayStyle {}

class Splash extends StatelessWidget {
  const Splash({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Screen(),
    );
  }
}

class Screen extends StatefulWidget {
  const Screen({Key key}) : super(key: key);

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home())));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: size.height * 0.4),
            child: Center(child: Image.asset('assets/logo-dark.png')),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.only(bottom: size.height * 0.041),
            child: Text('Developed By IndieSoft',
                style: GoogleFonts.ubuntu(fontSize: size.height * 0.020)),
          )
        ],
      ),
    );
  }
}
