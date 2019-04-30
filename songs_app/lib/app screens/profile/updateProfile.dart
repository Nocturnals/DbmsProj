import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:songs_app/app screens/profile/widgets.dart';
import 'package:songs_app/utils/database_files/usersCRUD.dart';
import 'package:songs_app/models/users.dart';
import 'package:songs_app/utils/database_helper.dart';
import 'package:songs_app/utils/database_files/usersCRUD.dart';

// Profile Widget...

class UpdateUserProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UpdateUserProfileState();
  }
}

class UpdateUserProfileState extends State<UpdateUserProfile> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  UpdateUserProfileState() {
    g2();
  }

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
    Map<String, dynamic> userMap =
        await UsersCRUD().getUserMapByEmail(emailid);
    User user = User.fromMaptoUser(userMap);
    return user;
  }

  Future<User> getUser()async{
    return getUserFromEmail();
  }
  void g2() async {
    String emailid = await _getUserAuthEmail();
    Map<String, dynamic> userMap =
        await UsersCRUD().getUserMapByEmail(emailid);
    _user = User.fromMaptoUser(userMap);

    setState(() {
      _email = _user.email;
      _firstName = _user.firstName;
      _lastName = _user.lastName;
      _gender = _user.gender;
      _dateOfBirth = _user.dateOfBirth;
      _lastLogin = _user.lastLogin;
      print(_user);
    });
    print(_email);
  }

void update() async {
    String emailid = await _getUserAuthEmail();
    Map<String, dynamic> userMap =
        await UsersCRUD().getUserMapByEmail(emailid);
            User user = User.fromMaptoUser(userMap);
        await UsersCRUD().updateUser(user);
  }

 List<String> MaptoList(Map<String, dynamic> map) {
    var _list = map.values.toList();
    return _list;
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Register Page'),
        ),
        body: Padding(
            padding: EdgeInsets.all(30.0),
            child: SingleChildScrollView(
                child: Form(
                    key: formkey,
                    child: Column(children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: _email,
                            icon: new Icon(
                              Icons.email,
                              color: Colors.grey,
                            )),
                            onSaved: (value) => _email = value),
                      
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: _firstName,
                            icon: new Icon(
                              Icons.email,
                              color: Colors.grey,
                            )),
                        validator: (value) =>
                            value.isEmpty ? null : null,
                            onSaved: (value) => value.isEmpty ? value = _firstName : _firstName = value,
                      ),
                      /*
                      TextFormField(
                        decoration: InputDecoration(
                            labelText:_Lastname,
                            icon: new Icon(
                              Icons.email,
                              color: Colors.grey,
                            )),
                        validator: (value) =>
                            value.isEmpty ? null : null,
                            onSaved: (value) =>value.isEmpty ? value = _Lastname: _Lastname = value
                      ),*/

                      //NOTE : I AM NOT ABLE TO UPDATE THE LAST NAME //
                    
                    
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: _gender,
                            icon: new Icon(
                              Icons.email,
                              color: Colors.grey,
                            )),
                        validator: (value) =>
                            value.isEmpty ?  null : null,
                            onSaved: (value) => value.isEmpty ? value = _gender :_gender = value,
                      ),

                      
                      RaisedButton(
                child: Text('Update Profile'),
                onPressed:(){
                       bool validator = validateForm();
                       if(validator == true){
                  //databaseHelper.updateEmailll(_email,_user);
                  UsersCRUD().updateFname(_firstName,_user);
                  UsersCRUD().updateLname(_lastName,_user);
                  UsersCRUD().updateGender(_gender,_user);
                  print('Email updated : $_email');
                  print('FirstName Updated : $_firstName ');
                  print('LastName Updated : $_lastName ');
                  print('StreetName Updated $_gender');
                  print('User : $_user');
                       }
                       else{
                         print('Not Validated');
                       }
             
                    //update();
                    
                  
                } ,
                color: Colors.green[300],
                  padding: const EdgeInsets.all(8.0),
                  textColor: Colors.white,
  
              ),
                    ])))));
  }

  void button(){
    
  }
bool validateForm() {
  final FormState form = formkey.currentState;
  if (form.validate()) {
    form.save();
    return true;
  }
  else
    return false;
  }
}