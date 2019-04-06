class SongBy {
  // attributes 
  int _songId;
  int _albumId;
  int _artistId;

//Constructor functions
  SongBy.id(this._songId, this._albumId, this._artistId);

  // get functions for variables
  int get songId => this._songId;
  int get albumId => this._albumId;
  int get artistId => this._artistId;

  // setter functions for variables
  set songId(int id) {
    this._songId = id;
  }
  set albumId(int id) {
    this._albumId = id;
  }
  set artistId(int id) {
    this._artistId = id;
  }

  // function to convert class object to map object
  Map<String,dynamic> toMap() {
    Map<String,dynamic> map = Map<String,dynamic>();

    map['songId'] = this._songId;
    map['albumId'] = this._albumId;
    map['artistId'] = this._artistId;

    return map;
  }

  // function to convert map object to class object
  SongBy.fromMaptoSongBy(Map<String,dynamic> map) {
    this._songId = map['songId'];
    this._albumId = map['albumId'];
    this._artistId = map['artistId'];
  }
}