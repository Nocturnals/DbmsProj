import 'dart:async';

import 'package:flutter/material.dart';

import 'package:songs_app/utils/database_helper.dart';
import 'package:songs_app/utils/database_files/usersCRUD.dart';
import 'package:songs_app/models/users.dart';
import 'package:sqflite/sqflite.dart';

class CreateDatabasePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _CreateDatabasePageState();
  }
}

class _CreateDatabasePageState extends State<CreateDatabasePage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Creating Database'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Hello World'),
            RaisedButton(
              child: Text('Add Database'),
              onPressed: _initializeDatabase,
            ),
            RaisedButton(
              child: Text('Insert Users'),
              onPressed: _doQuery1,
            ),
            RaisedButton(
              child: Text('Update Users'),
              onPressed: _doQuery2,
            )
          ],
        ),
      ),
    );
  }

  void _deleteDB() {
    DatabaseHelper databaseHelper = DatabaseHelper();
    print("\n\n\nDeleted database\n\n\n\n\n");
  }

  void _initializeDatabase() async {
    // UsersCRUD();
    // int result = await UsersCRUD().insertUser(user1);
    // print(result);
    var data = DatabaseHelper();
    Database db = await data.database;
    print(db);
    
  }

  void _doQuery1() async {
    var data = DatabaseHelper();
    // data.createTandI();
    Database db = await data.database;
    User user1 = User.withId(1,'Hemanth','vanam','hemanthtemp07@gmail.com','male',DateTime(1999,5,7),DateTime(2014,5,12),true);
    User user2 = User.withId(2,'Ravi','vanam','ravitemp07@gmail.com','male',DateTime(1999,5,7),DateTime(2014,5,12),true);
    User user3 = User.withId(3,'Chinna','sheripally','chinnatemp07@gmail.com','male',DateTime(1999,5,7),DateTime(2014,5,12),true);
    User user4 = User.withId(4,'parvathi','kenche','parvathitemp07@gmail.com','female',DateTime(1999,5,7),DateTime(2014,5,12),true);
    User user5 = User.withId(5,'chandana','sheripally','chandanatemp07@gmail.com','female',DateTime(1999,5,7),DateTime(2014,5,12),true);
    await UsersCRUD().insertUser(user1);
    await UsersCRUD().insertUser(user2);
    await UsersCRUD().insertUser(user3);
    await UsersCRUD().insertUser(user4);
    await UsersCRUD().insertUser(user5);
    dynamic result = await db.rawQuery('SELECT * FROM Users');
    printMap(result);
  }

  void _doQuery2() async {
    var data = DatabaseHelper();

    Database db = await data.database;
    User user1 = User.withId(1,'Hemanasdf','vanam','hemanthtemp07@gmail.com','male',DateTime(1999,5,7),DateTime(2014,5,12),true);
    await UsersCRUD().deleteUser(user1.email);
    dynamic result = await UsersCRUD().getUserList();
    print(result);
  }

  void printMap(List<Map<String,dynamic>> map) {
    for(int i=0; i<map.length;i++) {
      map[i].forEach((k,v) { return print('key $k, value:$v');});
      print('\n\n');
    }
  }
}