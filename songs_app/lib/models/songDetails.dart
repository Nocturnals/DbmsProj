import 'package:songs_app/models/songs.dart';
import 'package:songs_app/models/albums.dart';
import 'package:songs_app/models/artists.dart';

class SongDetails {
  // song details attributes
  Song _song;
  Album _album;
  Artist _artist;

  SongDetails(this._song,this._album,this._artist);

  Song get song => _song;
  Album get album => _album;
  Artist get artist => _artist;

  set song(Song song) {
    this._song = song;
  }
  set album(Album album) {
    this._album = album;
  }
  set artist(Artist artist) {
    this._artist = artist;
  }
}