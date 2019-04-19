import 'package:flutter/material.dart';

import 'package:songs_app/app screens/home.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProfileState();
  }
}

// Profile State...
class ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App Bar...
      appBar: new AppBar(
        title: new Text(
          'BLINK',
          style: TextStyle(fontFamily: 'Velhos Tempos', fontSize: 28),
        ),
        centerTitle: true,
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                debugPrint('Not Working!!');
              })
        ],
      ),

      // Body...
      body: Container(
        margin: EdgeInsets.only(top: 250),
        child: ListTile(
          title: Text(
            'Profile',
            style: TextStyle(fontSize: 40, fontFamily: 'LUMOS'),
            textAlign: TextAlign.center,
          ),
        ),
      ),

      // Side Drawer...
      drawer: SideDrawer(),

      // Bottom Navigation Bar...
      bottomNavigationBar: BottomNavigator(),
    );
  }
}
