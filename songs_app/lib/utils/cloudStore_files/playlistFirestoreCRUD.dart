import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:songs_app/models/playlist.dart';
import 'package:songs_app/utils/database_files/tables.dart';

class PlaylistFirestoreCRUD {
  
  /// inserts playlist map to the firestore collection
  // function to insert into playlist collection
  Future<DocumentReference> insertUser(Playlist playList) async {
    DocumentReference userDoc = await Firestore.instance.collection(PlaylistTable.tableName).add(playList.toMap());
    return userDoc;
  }

  /// gets playlist snapshot with playlistid as parameter
  Future<DocumentSnapshot> getUser(String playListId) async {
    DocumentSnapshot playlistSnap = await Firestore.instance.collection(PlaylistTable.tableName).document(playListId).get();
    return playlistSnap;
  }

  /// gets all playlists snapshots in list form
  Future<QuerySnapshot> getAllPlayLists() async {
    QuerySnapshot result = await Firestore.instance.collection(PlaylistTable.tableName).getDocuments();
    return result;
  }
}