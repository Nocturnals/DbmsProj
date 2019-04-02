class Artist {
  // artist attributes
  int _artistId;
  String _name;
  int _totalSongs;
  int _totalAlbums;
  int _imageId;

//constructer functions for variables

  Artist(this._name, this._totalSongs, this._totalAlbums, this._imageId);
  Artist.withId(this._artistId, this._name, this._totalSongs,
      this._totalAlbums, this._imageId);

//get function variables

  int get artistId {
    return _artistId;
  }

  int get totalSongs {
    return _totalSongs;
  }

  String get name {
    return _name;
  }

  int get totalAlbums {
    return _totalAlbums;
  }

  int get imageId {
    return _imageId;
  }

//setter functions for variables

  set name(String name) {
    this._name = name;
  }

  set totalSongs(int totalSongs) {
    this._totalSongs = totalSongs;
  }

  set totalAlbums(int totalAlbums) {
    this._totalAlbums = totalAlbums;
  }

  set imageId(int imageId) {
    this._imageId = imageId;
  }

//function to convert artist to map object
  Map<String, dynamic> toMap() {
    Map<String, dynamic> artistMap = Map<String, dynamic>();

    if (this._artistId != null) 
      artistMap['artistId'] = this._artistId;
    artistMap['name'] = this._name;
    artistMap['totalSongs'] = this._totalSongs;
    artistMap['totalAlbums'] = this._totalAlbums;
    artistMap['imageId'] = this._imageId;

    return artistMap;
  }

//function to convert map object to artist object

  Artist.fromMaptoArtist(Map<String, dynamic> map) {
    this._artistId = map['artistId'];
    this._name = map['name'];
    this._totalSongs = map['totalSongs'];
    this._totalAlbums = map['totalAlbums'];
    this._imageId = map['imageId'];
  }
}
