import 'package:flutter/material.dart';

class LoginSignUpPage extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() {
    return _LoginSignUpPageState();
  }
  
}

class _LoginSignUpPageState extends State<LoginSignUpPage> {

  bool _isLoading;

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
    if(_isLoading) {
      return Center(child: CircularProgressIndicator(),);
    }
    return Container(height: 0.0, width: 0.0,);
  }

  Widget _showBody() {
    
  }
}