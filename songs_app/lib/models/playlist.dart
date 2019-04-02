class Playlist {
  //playlist attributes
  int _playlist_id;
  int _user_id;
  String _name;

//constructor functions
  Playlist(this._user_id, this._name);
  Playlist.wihtID(this._playlist_id, this._user_id, this._name);

// get functions

  int get playlist_id {
    return _playlist_id;
  }

  String get name {
    return this._name;
  }

  int get user_id {
    return this._user_id;
  }

  //set functions
  set name(String name) {
    this._name = name;
  }

  set user_id(int id) {
    this._user_id = id;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> playlist_map = Map<String, dynamic>();
    playlist_map['playlist_id'] = this._playlist_id;
    playlist_map['user_id'] = this._user_id;
    playlist_map['name'] = this._name;

    return playlist_map;
  }
//function to convert map to playlist

  Playlist.fromMaptoPlaylist(Map<String, dynamic> map) {
    this._playlist_id = map['playlist_id'];
    this._user_id = map['user_id'];
    this._name = map['name'];
  }
}
