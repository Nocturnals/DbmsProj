class SongBy {
  // attributes 
  int _song_id;
  int _album_id;
  int _artist_id;

  // get functions for variables
  int get song_id => this._song_id;
  int get album_id => this._album_id;
  int get artist_id => this._album_id;

  // setter functions for variables
  set song_id(int id) {
    this._song_id = id;
  }
  set album_id(int id) {
    this._album_id = id;
  }
  set artist_id(int id) {
    this._artist_id = id;
  }

  // function to convert class object to map object
  Map<String,dynamic> toMap() {
    Map<String,dynamic> map = Map<String,dynamic>();

    map['song_id'] = this._song_id;
    map['album_id'] = this._album_id;
    map['artist_id'] = this._artist_id;

    return map;
  }

  // function to convert map object to class object
  SongBy.fromMaptoSongBy(Map<String,dynamic> map) {
    this._song_id = map['song_id'];
    this._album_id = map['album_id'];
    this._artist_id = map['artist_id'];
  }
}