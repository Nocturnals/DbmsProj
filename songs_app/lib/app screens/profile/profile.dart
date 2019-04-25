import 'package:flutter/material.dart';

import 'package:songs_app/app screens/home/home.dart';
import 'package:songs_app/app screens/profile/widgets.dart';


// Profile Widget...
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
      body: Stack(
        children: <Widget>[
          
          buildCoverPicture(),
          userImgName(context),
          
        ],
      ),
      backgroundColor: Colors.black,
    );
  }

}
