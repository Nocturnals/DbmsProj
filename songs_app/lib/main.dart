import 'package:flutter/material.dart';
// import 'package:songs_app/app screens/home.dart';
import 'package:songs_app/app screens/initiateDatabase.dart';

void main() {
  runApp(OnlineMusic());
}

class OnlineMusic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'BLINK',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      home: CreateDatabasePage(),
    );
  }
}
