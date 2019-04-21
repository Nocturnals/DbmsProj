import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:songs_app/models/users.dart';
import 'package:songs_app/utils/database_files/tables.dart';

class UserFirestoreCRUD {

  /// inserts user map to the firestore collection
  // function to insert into user collection
  Future<DocumentReference> insertUser(User user) async {
    return await Firestore.instance.collection(UsersTable.tableName).add(user.toMap());
  }

  Future<DocumentSnapshot> getUser(String userId) async {
    return await Firestore.instance.collection(UsersTable.tableName).document(userId).get();
  }
}