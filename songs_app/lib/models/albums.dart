class Album {
  // Attributes for album
  int _albumId;
  String _albumName;
  DateTime _releaseDate;
  double _albumLength;
  int _totalTracks;
  int _genreId;
  int _imageId;

  // get functions for variables
  int get albumId => this._albumId;
  String get albumName => this._albumName;
  DateTime get releaseDate => this._releaseDate;
  double get albumLength => this._albumLength;
  int get totalTracks => this._totalTracks;
  int get genreId => this._genreId;
  int get imageId => this._imageId;

  // setter functions for variables
  set albumName(String name) {
    this._albumName = name;
  }
  set releaseDate(DateTime date) {
    this._releaseDate = date;
  }
  set albumLength(double length) {
    this.albumLength = length;
  }
  set totalTracks(int songsCount) {
    this._totalTracks = songsCount;
  }
  set genreId(int id) {
    this._genreId = id;
  }
  set imageId(int id) {
    this._imageId = id;
  }

  // function to convert class object to map object
  Map<String,dynamic> toMap() {
    Map<String,dynamic> map = Map<String,dynamic>();

    if(this._albumId != null)
      map['albumId'] = this._albumId;
    map['albumName'] = this._albumName;
    map['releaseDate'] = this._releaseDate;
    map['albumLength'] = this._albumLength;
    map['totalTracks'] = this._totalTracks;
    map['genreId'] = this._genreId;
    map['imageId'] = this._imageId;

    return map;
  }

  Album.fromMaptoAlbum(Map<String,dynamic> map) {
    this._albumId = map['albumId'];
    this._albumName = map['albumName'];
    this._releaseDate = map['releaseDate'];
    this._albumLength = map['albumLength'];
    this._totalTracks = map['totalTracks'];
    this._genreId = map['genreId'];
    this._imageId = map['imageId'];
  }
}