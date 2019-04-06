import 'package:flutter/material.dart';

import 'package:songs_app/app screens/initiateDatabase.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Songs',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: true,
      home: CreateDatabasePage(), 
    );
  }
}
