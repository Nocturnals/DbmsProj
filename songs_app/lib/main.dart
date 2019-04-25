import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

import 'package:songs_app/app screens/profile/profile.dart';
import 'package:songs_app/app screens/home/home.dart';
import 'package:songs_app/app screens/login.dart';
import 'package:songs_app/app screens/register.dart';
import 'package:songs_app/app screens/resetPassword.dart';
import 'package:songs_app/app screens/testing/test.dart';
import 'package:songs_app/app screens/test.dart';
import 'package:songs_app/app screens/initiateDatabase.dart';
// import 'package:songs_app/app screens/now_playing.dart';

void main() {
  runApp(OnlineMusic());
}

class OnlineMusic extends StatelessWidget {

  final FirebaseAnalytics analytics = FirebaseAnalytics();

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'BLYNK',
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
        '/test': (BuildContext context) => TestPage(),
        // '/nowPlayingPage': (BuildContext context) => NowPlayingWidget(),
      },
      home: InitDatabasePage(),
      // home: ShowUsers(),
    );
  }
}
