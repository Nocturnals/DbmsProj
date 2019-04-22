import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

import 'package:songs_app/app screens/profile.dart';
import 'package:songs_app/app screens/home.dart';
import 'package:songs_app/app screens/login.dart';
import 'package:songs_app/app screens/register.dart';
import 'package:songs_app/app screens/resetPassword.dart';
<<<<<<< HEAD
import 'package:songs_app/app screens/testing/test.dart';
import 'package:songs_app/app screens/now_playing.dart';
=======
// import 'package:songs_app/app screens/test.dart';
>>>>>>> a83a1d97d8d4d2616291c9b91b8a32b35fc3de62

void main() {
  runApp(OnlineMusic());
}

class OnlineMusic extends StatelessWidget {

  final FirebaseAnalytics analytics = FirebaseAnalytics();

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'BLINK',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
      routes: <String, WidgetBuilder> {
        '/loginPage': (BuildContext context) => Login(),
        '/registerPage': (BuildContext context) => Register(),
        '/homePage': (BuildContext context) => Home(), 
        '/profilePage': (BuildContext context) => Profile(),
        '/resetPasswordPage': (BuildContext context) => ResetPassword(),
        '/playAsong': (BuildContext context) => AudioPlayerWidget(),
        // '/nowPlayingPage': (BuildContext context) => NowPlayingWidget(),
      },
      home: Login(),
      // home: ShowUsers(),
    );
  }
}
