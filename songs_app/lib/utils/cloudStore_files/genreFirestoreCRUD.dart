import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:songs_app/models/genre.dart';
import 'package:songs_app/utils/database_files/tables.dart';

class GenreFirestoreCRUD {

  /// inserts genre map to the firestore collection
  // function to insert into genre table
  Future<DocumentReference> insertGenre(Genre genre) async {
    DocumentReference genreDoc = await Firestore.instance.collection(GenreTable.tableName).add(genre.toMap());
    return genreDoc;
  }

  /// gets genre snapshot with genre id as parameter
  Future<DocumentSnapshot> getUser(String genreId) async {
    DocumentSnapshot userSnap = await Firestore.instance.collection(GenreTable.tableName).document(genreId).get();
    return userSnap;
  }

  /// gets all genre snapshots in list form
  Future<QuerySnapshot> getAllGenre() async {
    QuerySnapshot result = await Firestore.instance.collection(GenreTable.tableName).getDocuments();
    return result;
  }
}