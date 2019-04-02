class Includes {
// includes attributes

  int _includes_id;
  int _song_id;
  int _album_id;

//constructor functions

  Includes(this._song_id, this._album_id);
  Includes.withId(this._includes_id, this._song_id, this._album_id);

//getter functions

  int get includes_id {
    return _includes_id;
  }

  int get song_id {
    return _song_id;
  }

  int get album_id {
    return _album_id;
  }

//setter functions

  set song_id(int id) {
    this._song_id = id;
  }

  set album_id(int id) {
    this._album_id = id;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> includes_map = Map<String, dynamic>();
    includes_map['includes_id'] = this._includes_id;
    includes_map['song_id'] = this._song_id;
    includes_map['album_id'] = this._album_id;

    return includes_map;
  }

//functions to convert map object to includes objedct
  Includes.fromMaptoIncludes(Map<String, dynamic> map) {
    this._includes_id = map['includes_id'];
    this._song_id = map['song_id'];
    this._album_id = map['album_id'];
  }
}
