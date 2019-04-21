import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:songs_app/models/users.dart';
import 'package:songs_app/utils/database_files/tables.dart';

class UserFirestoreCRUD {

  /// inserts user map to the firestore collection
  // function to insert into user collection
  Future<DocumentReference> insertUser(User user) async {
    DocumentReference userDoc = await Firestore.instance.collection(UsersTable.tableName).add(user.toMap());
    return userDoc;
  }

  /// gets user snapshot with userid as parameter
  Future<DocumentSnapshot> getUser(String userId) async {
    DocumentSnapshot userSnap = await Firestore.instance.collection(UsersTable.tableName).document(userId).get();
    return userSnap;
  }

  /// gets all users snapshots in list form
  Future<QuerySnapshot> getAllUsers() async {
    QuerySnapshot result = await Firestore.instance.collection(UsersTable.tableName).getDocuments();
    return result;
  }
}