import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// import 'package:songs_app/services/authentication.dart';
// import 'package:songs_app/models/users.dart';
// import 'package:songs_app/utils/database_files/usersCRUD.dart';

import 'package:songs_app/models/artists.dart';
import 'package:songs_app/models/albums.dart';
import 'package:songs_app/models/songs.dart';

import 'package:songs_app/utils/database_files/artist.CRUD.dart';
import 'package:songs_app/utils/database_files/albumsCRUD.dart';
import 'package:songs_app/utils/database_files/songsCRUD.dart';

import 'package:songs_app/utils/cloudStore_files/artistFirestoreCRUD.dart';
import 'package:songs_app/utils/cloudStore_files/albumFirestoreCRUD.dart';
import 'package:songs_app/utils/cloudStore_files/songFirestoreCRUD.dart';


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
      ),
      onWillPop: () {
        Navigator.of(context).pop();
      },
    );
  }

  Widget _getBody() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text('Add Artists'),
            onPressed: addArtist,
          ),
          RaisedButton(
            child: Text('Add Albums'),
            onPressed: addAlbum,
          ),
          RaisedButton(
            child: Text('Add Songs'),
            onPressed: addSong,
          )
        ],
      ),
    );
  }

  void addArtist() async {
    List<Artist> artistList = List<Artist>();

    // artistList.add(Artist(_name, _totalSongs, _totalAlbums, _imageId));

    for (Artist artist in artistList) {
      DocumentReference ref = await ArtistFirestoreCRUD().insertArtist(artist);
      DocumentSnapshot snap = await ref.get();
      Artist newArtist = Artist.fromFirestoreMaptoArtist(snap.data, snap.documentID);
      await ArtistsCRUD().insertArtist(newArtist);
    }
  }

  void addAlbum() async {
    List<Album> albumList = List<Album>();

    // albumList.add(Album(_albumName, _releaseDate, _albumLength, _totalTracks, _genreId, _imageId));

    for (Album album in albumList) {
      DocumentReference ref = await AlbumFirestoreCRUD().insertAlbum(album);
      DocumentSnapshot snap = await ref.get();
      Album newAlbum = Album.fromFirestoreMaptoAlbum(snap.data, snap.documentID);
      await AlbumCRUD().insertAlbum(newAlbum);
    }
  }

  void addSong() async {
    List<Song> songList = List<Song>();

    // songList.add(Song(_title,_length,_location,_albumid,_genreid,imageid));

    for (Song song in songList) {
      DocumentReference ref = await SongFirestoreCRUD().insertSong(song);
      DocumentSnapshot snap = await ref.get();
      Song newSong = Song.fromFirestoreMaptoSong(snap.data, snap.documentID);
      await SongsCRUD().insertSong(newSong);
    }
  }
}