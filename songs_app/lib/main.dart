import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(OnlineMusic());
}

class OnlineMusic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Online Music Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      home: Home(),
    );
  }
}
