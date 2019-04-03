import 'dart:async';
import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'package:songs_app/utils/database_files/tables.dart';

class DatabaseHelper {
  // Making the instances of the class singleton
  static DatabaseHelper _databaseHelper;
  static Database _database;

  // some constant variables

  // named constructor to get new instance of databasehelper class
  DatabaseHelper._createInstance();

  // constructor for the databasehelper class
  factory DatabaseHelper() {
    if(_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  // get function for the database instance
  Future<Database> get database async {
    if(_database == null) {
      _database = await _initializeDatabase();
    }
    return _database;
  }

  Future<Database> _initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'songs_app.db';

    Future<Database> userDatabase = openDatabase(path,version: 1,onCreate: _createDB);
    return userDatabase;
  }

  void _createDB(Database db, int version) async {
    await db.execute(UsersTable.createTable);
    await db.execute(GenreTable.createTable);
    await db.execute(PlaylistTable.createTable);
    await db.execute(Imagestable.createTable);
    await db.execute(AlbumsTable.createTable);
    await db.execute(ArtistTable.createTable);
    await db.execute(SongsTable.createTable);
    await db.execute(SongByTable.createTable);
    await db.execute(FrequentlyHeardTable.createTable);
    await db.execute(IncludesTable.createTable);
  }
}