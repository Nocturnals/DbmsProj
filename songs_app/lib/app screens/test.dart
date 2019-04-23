import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:songs_app/models/genre.dart';
import 'package:songs_app/utils/database_files/genreCRUD.dart';
import 'package:songs_app/utils/cloudStore_files/genreFirestoreCRUD.dart';

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          leading: null,
          title: Text(
            'BLINK',
            style: TextStyle(
              fontSize: 25,
              fontFamily: 'Velhos Tempos',
            ),
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
        ),
        body: _getBody(),
      )
    );
  }

  Widget _getBody() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text('Add data'),
            onPressed: addData,
          ),
        ],
      ),
    );
  }

  void addData() async {
    List<Genre> genreList = List<Genre>();

    genreList.add(Genre('Rock'));
    genreList.add(Genre('Party'));
    genreList.add(Genre('Horror'));

    for (Genre genre in genreList) {
      DocumentReference ref = await GenreFirestoreCRUD().insertGenre(genre);
      DocumentSnapshot snap = await ref.get();
      Genre newGenre = Genre.fromFirestoreMaptoGenre(snap.data, snap.documentID);
      await GenreCRUD().insertGenre(newGenre);
    }
  }
}