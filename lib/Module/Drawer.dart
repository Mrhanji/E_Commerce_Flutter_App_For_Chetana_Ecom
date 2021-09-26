import 'package:flutter/material.dart';

class DrawerS extends StatelessWidget {
  const DrawerS({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(150),
        ),
        child: SizedBox(
          width: 250,
          child: Drawer(
              child: ListView(children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                      image: AssetImage('assets/cartbord.png'))),
              accountName: new Text(
                '',
                style: TextStyle(
                  fontSize: 1,
                  fontWeight: FontWeight.w800,
                  //color: Colors.grey[300],
                  color: Colors.black,
                ),
              ),
              accountEmail: Text(
                '',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Home',
                style: TextStyle(
                  fontSize: size.height * 0.021,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              onTap: () {
           //     _scaffoldkey.currentState.openEndDrawer();
              },
              leading: new Icon(
                Icons.home,
                size: size.height * 0.035,
                color: Colors.black,
              ),
            ),
            ListTile(
              title: Text(
                'Track Order',
                style: TextStyle(
                  fontSize: size.height * 0.021,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              onTap: () {
             //   _scaffoldkey.currentState.openEndDrawer();
              },
              leading: new Icon(
                Icons.delivery_dining,
                size: size.height * 0.035,
                color: Colors.black,
              ),
            ),
            Divider(
              thickness: 0.5,
              color: Colors.grey,
            ),
            ListTile(
              title: Text(
                'Share',
                style: TextStyle(
                  fontSize: size.height * 0.021,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              onTap: () {
              //  _scaffoldkey.currentState.openEndDrawer();
              },
              leading: new Icon(
                Icons.privacy_tip,
                size: size.height * 0.035,
                color: Colors.black,
              ),
            ),
            ListTile(
              title: Text(
                'Share',
                style: TextStyle(
                  fontSize: size.height * 0.021,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              onTap: () {
         //       _scaffoldkey.currentState.openEndDrawer();
              },
              leading: new Icon(
                Icons.share,
                size: size.height * 0.035,
                color: Colors.black,
              ),
            ),
            ListTile(
              title: Text(
                'Whole Sale',
                style: TextStyle(
                  fontSize: size.height * 0.021,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              onTap: () {
               // _scaffoldkey.currentState.openEndDrawer();
              },
              leading: new Icon(
                Icons.money_off_csred_rounded,
                size: size.height * 0.035,
                color: Colors.black,
              ),
            ),
            ListTile(
              title: Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: size.height * 0.021,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              onTap: () {
               // _scaffoldkey.currentState.openEndDrawer();
              },
              leading: new Icon(
                Icons.contact_support,
                size: size.height * 0.035,
                color: Colors.black,
              ),
            ),
            ListTile(
              title: Text(
                'Logout',
                style: TextStyle(
                  fontSize: size.height * 0.021,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              onTap: () {
              //  _scaffoldkey.currentState.openEndDrawer();
              },
              leading: new Icon(
                Icons.logout,
                size: size.height * 0.035,
                color: Colors.black,
              ),
            ),
          ])),
        ),
      ),
    );
  }
}
