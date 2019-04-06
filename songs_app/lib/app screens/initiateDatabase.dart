import 'dart:async';

import 'package:flutter/material.dart';

import 'package:songs_app/utils/database_helper.dart';
import 'package:songs_app/utils/database_files/usersCRUD.dart';
import 'package:songs_app/models/users.dart';
import 'package:sqflite/sqflite.dart';


import 'package:songs_app/utils/database_files/songbyCRUD.dart';
import 'package:songs_app/utils/database_files/songsCRUD.dart';
import 'package:songs_app/utils/database_files/frequentlyheardCRUD.dart';
import 'package:songs_app/utils/database_files/includesCRUD.dart';

import 'package:songs_app/models/songs.dart';
import 'package:songs_app/models/songby.dart';
import 'package:songs_app/models/frequentlyHeard.dart';
import 'package:songs_app/models/includes.dart';


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
            ),
            RaisedButton(
              child: Text('insert songs'),
              onPressed: _doQuery50,
            ),
            RaisedButton(
              child: Text('Update song'),
              onPressed: _doQuery51,
            ),
            RaisedButton(
              child: Text('delete songs'),
              onPressed: _doQuery52,
            ),
            RaisedButton(
              child: Text('insert songby'),
              onPressed: _doQuery53,
            ),
            RaisedButton(
              child: Text('update songby'),
              onPressed: _doQuery54,
            ),
            RaisedButton(
              child: Text('delete songby'),
              onPressed: _doQuery55,
            ),
            RaisedButton(
              child: Text('insert freq'),
              onPressed: _doQuery56,
            ),
            RaisedButton(
              child: Text('update freq'),
              onPressed: _doQuery57,
            ),
            RaisedButton(
              child: Text('delete freq'),
              onPressed: _doQuery58,
            ),
            RaisedButton(
              child: Text('insert freq'),
              onPressed: _doQuery59,
            ),
            RaisedButton(
              child: Text('update freq'),
              onPressed: _doQuery60,
            ),
            RaisedButton(
              child: Text('delete freq'),
              onPressed: _doQuery61,
            ),
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

    void _doQuery50() async {
    var data = DatabaseHelper();
    // data.createTandI();
    Database db = await data.database;
    Song song1 = Song.withId(1, 'IntheEnd', 150 , 4, 5, 6);
    Song song2 = Song.withId(2, 'new', 150 , 8, 2, 6);
    Song song3 = Song.withId(3, 'kiss', 150 , 6, 5, 6);
    Song song4 = Song.withId(4, 'anything', 150 , 4, 7, 6);
   
    await SongsCRUD().insertSong(song1);
    await SongsCRUD().insertSong(song2);
    await SongsCRUD().insertSong(song3);
    await SongsCRUD().insertSong(song4);
    
    dynamic result = await db.rawQuery('SELECT * FROM Songs');
    printMap(result);
  }

  void _doQuery51() async {
    var data = DatabaseHelper();

    Database db = await data.database;
    Song song1 = Song.withId(1, 'In the End', 150 , 4, 5, 6);
    await SongsCRUD().updateSong(song1);
    dynamic result = await SongsCRUD().getSongList();
    print(result);
  }
  void _doQuery52() async {
    var data = DatabaseHelper();

    Database db = await data.database;
    Song song1 = Song.withId(1, 'In the End', 150 , 4, 5, 6);
    await SongsCRUD().deleteSong(song1.title);
    dynamic result = await SongsCRUD().getSongList();
    print(result);
  }

  void _doQuery53() async {
    var data = DatabaseHelper();
    // data.createTandI();
    Database db = await data.database;
    
    SongBy songby1 = SongBy(1,4,5);
    SongBy songby2= SongBy(1,4,5);
    SongBy songby3 = SongBy(1,4,5);
    
    await SongByCRUD().insertSongBy(songby1);
    await SongByCRUD().insertSongBy(songby2);
    await SongByCRUD().insertSongBy(songby3);

    dynamic result = await db.rawQuery('SELECT * FROM SongBy');
    printMap(result);
  }

  void _doQuery54() async {
    var data = DatabaseHelper();

    Database db = await data.database;
    SongBy songby1 = SongBy(1,4,5);
    await SongByCRUD().updateSongBy(songby1);
    dynamic result = await SongByCRUD().getSongByList();
    print(result);
  }

  void _doQuery55() async {
    var data = DatabaseHelper();

    Database db = await data.database;
    SongBy songby1 = SongBy(1,4,5);
    await SongByCRUD().deleteSongBy(songby1.artistId);
    dynamic result = await SongByCRUD().getSongByList();
    print(result);
  }

  void _doQuery56() async {
    var data = DatabaseHelper();
    // data.createTandI();
    Database db = await data.database;
    
    FrequentlyHeard freq1 = FrequentlyHeard(1, 2, 2, 1, 2);
    FrequentlyHeard freq2 = FrequentlyHeard(2, 4, 1, 1, 2);
    FrequentlyHeard freq3 = FrequentlyHeard(3, 2, 2, 1, 2);

    await FrequentlyHeardCRUD().insertFrequentlyHeard(freq1);
    await FrequentlyHeardCRUD().insertFrequentlyHeard(freq2);
    await FrequentlyHeardCRUD().insertFrequentlyHeard(freq3);

    dynamic result = await db.rawQuery('SELECT * FROM FrequentlyHeard');
    printMap(result);
  }
  
  void _doQuery57() async {
    var data = DatabaseHelper();

    Database db = await data.database;
    FrequentlyHeard freq1 = FrequentlyHeard(1, 2, 2, 1, 2);
    await FrequentlyHeardCRUD().updateFrequentlyHeard(freq1);
    dynamic result = await FrequentlyHeardCRUD().getFrequentlyHeardById(2);
    print(result);
  }

  void _doQuery58() async {
    var data = DatabaseHelper();

    Database db = await data.database;
    FrequentlyHeard freq1 = FrequentlyHeard(1, 2, 2, 1, 2);
    await FrequentlyHeardCRUD().deleteFrequentlyHeard(freq1);
    dynamic result = await FrequentlyHeardCRUD().getFrequentlyHeardById(2);
    print(result);
  }

   void _doQuery59() async {
    var data = DatabaseHelper();
    // data.createTandI();
    Database db = await data.database;
    
    Includes incl1 = Includes.withId(1, 1, 2);
    Includes incl2 = Includes.withId(2, 2, 3);
    Includes incl3 = Includes.withId(3, 3, 4);

    dynamic result = await db.rawQuery('SELECT * FROM Includes');
    printMap(result);
  }

  void _doQuery60() async {
    var data = DatabaseHelper();

    Database db = await data.database;
    
    Includes incl2 = Includes.withId(2, 2, 3);
    await IncludesCRUD().updateIncludes(incl2);
    dynamic result = await IncludesCRUD().getIncludesMapById(2);
    print(result);
  }

  void _doQuery61() async {
    var data = DatabaseHelper();

    Database db = await data.database;

    
    Includes incl2 = Includes.withId(2, 2, 3);
    
    await IncludesCRUD().deleteIncludes(incl2.songId);
    dynamic result = await IncludesCRUD().getIncludesMapById(2);
    print(result);
  }


}