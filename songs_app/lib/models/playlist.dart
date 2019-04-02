class Playlist {
  //playlist attributes
  int _playlistId;
  int _userId;
  String _name;

//constructor functions
  Playlist(this._userId, this._name);
  Playlist.wihtID(this._playlistId, this._userId, this._name);

// get functions

  int get playlistId {
    return _playlistId;
  }

  String get name {
    return this._name;
  }

  int get userId {
    return this._userId;
  }

  //set functions
  set name(String name) {
    this._name = name;
  }

  set userId(int id) {
    this._userId = id;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> playlistMap = Map<String, dynamic>();
    playlistMap['playlistId'] = this._playlistId;
    playlistMap['userId'] = this._userId;
    playlistMap['name'] = this._name;

    return playlistMap;
  }
//function to convert map to playlist

  Playlist.fromMaptoPlaylist(Map<String, dynamic> map) {
    this._playlistId = map['playlistId'];
    this._userId = map['userId'];
    this._name = map['name'];
  }
}
