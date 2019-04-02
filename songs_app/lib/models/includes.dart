class Includes {
// includes attributes

  int _includesId;
  int _songId;
  int _albumId;

//constructor functions

  Includes(this._songId, this._albumId);
  Includes.withId(this._includesId, this._songId, this._albumId);

//getter functions

  int get includesId {
    return _includesId;
  }

  int get songId {
    return _songId;
  }

  int get albumId {
    return _albumId;
  }

//setter functions

  set songId(int id) {
    this._songId = id;
  }

  set albumId(int id) {
    this._albumId = id;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> includesMap = Map<String, dynamic>();
    includesMap['includesId'] = this._includesId;
    includesMap['songId'] = this._songId;
    includesMap['albumId'] = this._albumId;

    return includesMap;
  }

//functions to convert map object to includes objedct
  Includes.fromMaptoIncludes(Map<String, dynamic> map) {
    this._includesId = map['includesId'];
    this._songId = map['songId'];
    this._albumId = map['albumId'];
  }
}
