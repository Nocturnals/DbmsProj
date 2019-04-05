import 'dart:async';

import 'package:flutter/material.dart';

import 'package:songs_app/app screens/home.dart';
import 'package:songs_app/services/authentication.dart';

class LoginSignUpPage extends StatefulWidget {
  
  final BaseAuth auth = BaseAuth();

  @override
  State<StatefulWidget> createState() {
    return _LoginSignUpPageState();
  }
}

enum FormMode { LOGIN, SIGNUP }

class _LoginSignUpPageState extends State<LoginSignUpPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  FormMode _formMode = FormMode.LOGIN;

  
  bool _isLoading;

  String _email;
  String _password;

  @override
  void initState() {
    _isLoading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Stack(
        children: <Widget>[
          _showBody(),
          _showCircularProgress(),
        ],
      ),
    );
  }

  Widget _showCircularProgress() {
    if (_isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }

  Widget _showBody() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            _showLogo(),
            _showEmailInput(),
            _showPasswordInput(),
            _showSaveButtom(),
            _showSecondaryButton(),
          ],
        ),
      ),
    );
  }

  Widget _showLogo() {
    return Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 48.0,
          child: Image.asset('assets/LoginLogo.jpg'),
        ),
      ),
    );
  }

  Widget _showEmailInput() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
      child: TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: InputDecoration(
          hintText: 'Email',
          icon: Icon(
            Icons.mail,
            color: Colors.grey,
          ),
        ),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onSaved: (value) => _email = value,
      ),
    );
  }

  Widget _showPasswordInput() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
      child: TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Password',
          icon: Icon(
            Icons.mail,
            color: Colors.grey,
          ),
        ),
        validator: (value) => (value.isEmpty || value.length <= 6)
            ? 'Password can\'t be empty and atleast 6 letter'
            : null,
        onSaved: (value) => _password = value,
      ),
    );
  }

  Widget _showSaveButtom() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
      child: RaisedButton(
        elevation: 5.0,
        color: Colors.blue,
        child: _formMode == FormMode.LOGIN
            ? Text(
                'Login',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              )
            : Text('SignUp',
                style: TextStyle(fontSize: 20.0, color: Colors.white)),
        onPressed: _validateAndSubmit,
      ),
    );
  }

  Widget _showSecondaryButton() {
    return FlatButton(
      child: _formMode == FormMode.LOGIN
          ? Text(
              'Create an Account',
              style: TextStyle(fontSize: 15.0, color: Colors.grey),
            )
          : Text(
              'Login',
              style: TextStyle(fontSize: 15.0, color: Colors.grey),
            ),
      onPressed: _toggleFormKey,
    );
  }

  void _toggleFormKey() {
    _formKey.currentState.reset();

    if (_formMode == FormMode.LOGIN) {
      setState(() {
        _formMode = FormMode.SIGNUP;
      });
      return;
    }
    setState(() {
      _formMode = FormMode.LOGIN;
    });
    return;
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
      }
    );
  }

  bool _validateAndSave() {
    final FormState form = _formKey.currentState;
    if(form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void _validateAndSubmit() async {
    setState(() {
     _isLoading = true; 
    });
    if(_validateAndSave()) {
              debugPrint('Validated the form');
      String userId = "";
      try {
        if (_formMode == FormMode.LOGIN) {
          userId = await widget.auth.login(_email, _password);
          print('Signed in: $userId');
        } else {
          userId = await widget.auth.signUp(_email, _password);
          widget.auth.sendEmailVerification();
          _showAlertDialog('Status','Check your mail to verify');
          print('Signed up user: $userId');
        }
        setState(() {
          _isLoading = false;
        });

        if (userId.length > 0 && userId != null && _formMode == FormMode.LOGIN) {
          _onSignedIn();
        }

      } catch (e) {
        print('Error: $e');
        setState(() {
          _isLoading = false;
          _showAlertDialog('Error', e.message);
        });
      }

    }
  }

  void _onSignedIn() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomePage();
    }));
  }
}
