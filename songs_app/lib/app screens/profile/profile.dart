import 'package:flutter/material.dart';

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
    return WillPopScope(
      child: Scaffold(
        appBar: appBar(context),
        body: Column(
          children: <Widget>[

            // goBackButton(context),
            Stack(
              children: <Widget>[
                
                buildCoverPicture(),

                userImgName(context, 'assets/artists/duaLipa.jpg'),
                
              ],
            ),

          ],
        ),
        backgroundColor: Colors.black,
      ),
      onWillPop: () {Navigator.of(context).pop();},
    );
  }
}
