import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:songs_app/services/authentication.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final BaseAuth auth = BaseAuth();

  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          leading: null,
          title: Text(
            'BLINK',
            style: TextStyle(
              fontSize: 25,
              fontFamily: 'Velhos Tempos',
            ),
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 70),
                      child: Icon(
                        Icons.account_circle,
                        size: 120,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 20),
                      child: Text(
                        'LOG IN',
                        style: TextStyle(
                            fontSize: 40,
                            fontFamily: 'TooneyNoodle',
                            color: Colors.deepPurple),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      width: 350,
                      height: 50,
                      margin: EdgeInsets.only(bottom: 30),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.justify,
                        cursorRadius: Radius.circular(5),
                        cursorColor: Colors.grey,
                        autocorrect: true,
                        keyboardAppearance: Brightness.dark,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.deepPurple)),
                          labelText: 'Email',
                          hintText: 'example@example.com',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Email can\'t be empty';
                          }
                          if (!value.contains('@')) {
                            return 'Please provide correct emailid';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _email = value;
                        },
                      ),
                    ),
                    Container(
                      width: 350,
                      height: 50,
                      margin: EdgeInsets.all(5),
                      child: TextFormField(
                        textAlign: TextAlign.justify,
                        cursorRadius: Radius.circular(5),
                        cursorColor: Colors.grey,
                        keyboardAppearance: Brightness.dark,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.deepPurple)),
                          labelText: 'Password',
                          hintText: '*************',
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Password can\'t be emply';
                          }
                          if (value.length < 6) {
                            return 'Password must be atleast 6 characters';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _password = value;
                        },
                      ),
                    ),
                    Container(
                        width: 350,
                        margin: EdgeInsets.only(top: 30, bottom: 40),
                        child: RaisedButton(
                          child: Text(
                            'LOG IN',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            _validateAndSubmit();
                          },
                          color: Colors.indigo,
                        )),
                    Container(
                        child: Column(
                      children: <Widget>[
                        Text(
                          'Not yet registered? tap the register button',
                        ),
                        Container(
                          width: 120,
                          child: FlatButton(
                            child: Text(
                              'Register',
                              style: TextStyle(fontSize: 15),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed('/registerPage');
                            },
                            textColor: Colors.blue,
                          ),
                        )
                      ],
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      onWillPop: () {
        AlertDialog alertDialog = AlertDialog(
          title: Center(
            child: Text('Are you sure'),
          ),
          content: Text('  want to close the app?'),
          actions: <Widget>[
            FlatButton(
              child: Text('Not Yet'),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop('dialog');
              },
            ),
            FlatButton(
              child: Text('Yes'),
              onPressed: () {
                // return exit(0);
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
            ),
          ],
        );
        showDialog(
            context: context,
            builder: (_) {
              return alertDialog;
            });
      },
    );
  }

  bool _validateAndSave() {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void _validateAndSubmit() async {
    if (_validateAndSave()) {
      debugPrint('Validated the form');
      try {
        String userid = await auth.login(_email, _password);
        print(userid);
        bool userStatus = await auth.isEmailVerified();
        print('user Status:$userStatus');
        if (userStatus == false) {
          showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  title: Center(
                    child: Text(
                      'Please verify your email before login',
                      style: TextStyle(
                          color: Colors.red, fontFamily: 'Magnificent'),
                    ),
                  ),
                  content: Text('click on resend mail verfication'),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('Resend mail'),
                      onPressed: _resendEmailVerification,
                    ),
                    FlatButton(
                      child: Text('OK'),
                      onPressed: () {
                        auth.signOut();
                        Navigator.of(context,rootNavigator: true).pop('dialog');
                      },
                    )
                  ],
                );
              });
        } else {
          Navigator.of(context).pushReplacementNamed('/homePage');
        }
        // _getUserFromDB();
      } catch (error) {
        print('error: $error');
        _showAlertDialog('Error', error.toString());
      }
    }
  }

  void _resendEmailVerification() async {
    await auth.sendEmailVerification();
    await auth.signOut();
    Navigator.of(context,rootNavigator: true).pop('dialog');
  }

  void _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(
        context: context,
        builder: (_) {
          return alertDialog;
        });
  }
}
