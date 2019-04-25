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

import 'package:flutter/services.dart' show rootBundle;
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:math';
import 'dart:io';
import 'dart:typed_data';

class TestPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return TestPageState();
  }
}

class TestPageState extends State<TestPage> {

  File _chachedFile;
  String _paths;

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
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.cloud_download),
          onPressed: () async {
            _filedownload(_paths);
          },
        ),
      ),
      onWillPop: () {
        Navigator.of(context).pop();
      },
    );
  }

  Future<void> _fileUpload(String filePath) async {
    ByteData bytes = await rootBundle.load(filePath);
    Directory tempDir = Directory.systemTemp;
    String fileName = '${Random().nextInt(10000)}.jpg';

    File newFile = File('${tempDir.path}/$fileName');
    await newFile.writeAsBytes(bytes.buffer.asInt8List(), mode: FileMode.write);

    StorageReference ref =
        FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask task = ref.putFile(newFile);
    StorageTaskSnapshot snapshot = await task.onComplete;
    String downloadUri = await snapshot.ref.getDownloadURL();
    print(downloadUri);
    setState(() {
     _paths = downloadUri.toString(); 
    });
    print(_paths);
  }

  Future<void> _filedownload(String https) async {
    print('Https :$https');
    // final RegExp exp = RegExp('([^?/]*\.(jpg))');
    final String filename = 'newFile';
    final Directory tempDir = Directory.systemTemp;
    final file = File('${tempDir.path}/$filename');
    
    print(filename);
    final StorageReference ref = FirebaseStorage.instance.ref().child('Images/1511.jpg');
    final StorageFileDownloadTask task = ref.writeToFile(file);
    final int bytecount = (await task.future).totalByteCount;
    setState(() {
     _chachedFile = file; 
    });
    print(bytecount);
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
          ),
          Row(
            children: dogPaths
                .map((name) => GestureDetector(
                      child: Image.asset(
                        name,
                        width: 100,
                      ),
                      onTap: () async {
                        await _fileUpload(name);
                      },
                    ))
                .toList(),
          ),
          Container(
            color: Colors.black,
            width: 150,
            height: 150,
            child: _chachedFile != null ? Image.asset(_chachedFile.path) : Container(),
          ),
        ],
      ),
    );
  }

  final List<String> dogPaths = <String>[
    'assets/dog1.jpg',
    'assets/dog2.jpg',
    'assets/dog3.jpg',
    'assets/dog4.jpg',
  ];

  void addArtist() async {
    List<Artist> artistList = List<Artist>();

    // artistList.add(Artist(_name, _totalSongs, _totalAlbums, _imageId));

    for (Artist artist in artistList) {
      DocumentReference ref = await ArtistFirestoreCRUD().insertArtist(artist);
      DocumentSnapshot snap = await ref.get();
      Artist newArtist =
          Artist.fromFirestoreMaptoArtist(snap.data, snap.documentID);
      await ArtistsCRUD().insertArtist(newArtist);
    }
  }

  void addAlbum() async {
    List<Album> albumList = List<Album>();

    // albumList.add(Album(_albumName, _releaseDate, _albumLength, _totalTracks, _genreId, _imageId));

    for (Album album in albumList) {
      DocumentReference ref = await AlbumFirestoreCRUD().insertAlbum(album);
      DocumentSnapshot snap = await ref.get();
      Album newAlbum =
          Album.fromFirestoreMaptoAlbum(snap.data, snap.documentID);
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
