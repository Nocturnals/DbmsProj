class Song {
// Song attributes
  int _songId;
  String _title;
  double _length;
  int _albumId;
  int _genreId;
  int _imageId;

//Constructor functions
  Song(this._title, this._length, this._albumId, this._genreId,
      this._imageId);
  Song.withId(this._songId, this._title, this._length, this._albumId,
      this._genreId, this._imageId);

// get functions for variables
  int get songId {
    return _songId;
  }

  String get title {
    return _title;
  }

  double get length {
    return _length;
  }

  int get albumId {
    return _albumId;
  }

  int get genreId {
    return _genreId;
  }

  int get imageId {
    return _imageId;
  }

//setter functions for variables
  set title(String title) {
    this._title = title;
  }

  set length(double length) {
    this._length = length;
  }

  set albumId(int albumId) {
    this._albumId = albumId;
  }

  set genreId(int genreId) {
    this._genreId = genreId;
  }

  set imageId(int imageId) {
    this._imageId = imageId;
  }

// function to convert song to map object

  Map<String, dynamic> toMap() {
    Map<String, dynamic> songMap = Map<String, dynamic>();

    if (this._songId != null) 
      songMap["songId"] = this._songId;
    songMap["title"] = this._title;
    songMap["length"] = this._length;
    songMap["albumId"] = this._albumId;
    songMap["genreId"] = this._genreId;
    songMap['imageId'] = this._imageId;

    return songMap;
  }

//function to convert map object to song object
  Song.fromMaptoSong(Map<String, dynamic> map) {
    this._songId = map["songId"];
    this._title = map["title"];
    this._length = map["length"];
    this._albumId = map["albumId"];
    this._genreId = map["genreId"];
    this._imageId = map['imageId'];
  }

// Function to convert a song object to list
  List fromSongtoList(){
    return [this._title, this._length, this._albumId, this._genreId, this._imageId];
  }
}
