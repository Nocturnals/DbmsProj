import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:songs_app/app screens/profile/widgets.dart';
import 'package:songs_app/models/users.dart';
import 'package:songs_app/utils/database_files/usersCRUD.dart';

// Profile Widget...
class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProfileState();
  }
}

// Profile State...
class ProfileState extends State<Profile> {
  User _user;
  // String _userId;
  String _firstName;
  String _lastName;
  String _email;
  String _gender;
  DateTime _dateOfBirth;
  DateTime _lastLogin;
  bool _activeStatus;

  String _userEmail;

  Future<String> _getUserAuthEmail() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    setState(() {
      _userEmail = user.email;

      print(_userEmail);
    });
    return this._userEmail;
  }

  Future<User> getUserFromEmail() async {
    String emailid = await _getUserAuthEmail();
    Map<String, dynamic> userMap = await UsersCRUD().getUserMapByEmail(emailid);
    User user = User.fromMaptoUser(userMap);
    return user;
  }

  Future<User> getUser() async {
    _user = await getUserFromEmail();
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

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
                userImgName(context, 'assets/artists/duaLipa.jpg', _user.firstName, _user.lastName),
              ],
            ),
            RichText(
              text: TextSpan(
                text: 'First Name:'+_user.firstName,
                style:TextStyle(fontSize: 30,color:Colors.blue),
              ),
            ),
            Container(height: 10),
            RichText(
              text: TextSpan(
                text: 'Last Name:'+_user.lastName,
                style:TextStyle(fontSize: 30,color:Colors.blue),
              ),
            ),
            Container(height: 10),
            RichText(
              text: TextSpan(
                text: 'Email:'+_user.email,
                style:TextStyle(fontSize: 20,color:Colors.blue),
              ),
            ),
            Container(height: 10),
            RichText(
              text: TextSpan(
                text: 'Gender'+_user.gender,
                style:TextStyle(fontSize: 30,color:Colors.blue),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.black,
      ),
      onWillPop: () {
        Navigator.of(context).pop();
      },
    );
  }
}
