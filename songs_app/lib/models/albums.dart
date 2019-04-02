class Album {
  // Attributes for album
  int _album_id;
  String _album_name;
  DateTime _release_date;
  double _album_length;
  int _total_tracks;
  int _genre_id;
  int _image_id;

  // get functions for variables
  int get album_id => this._album_id;
  String get album_name => this._album_name;
  DateTime get release_date => this._release_date;
  double get album_length => this._album_length;
  int get total_tracks => this._total_tracks;
  int get genre_id => this._genre_id;
  int get image_id => this._image_id;

  // setter functions for variables
  set album_name(String name) {
    this._album_name = name;
  }
  set release_date(DateTime date) {
    this._release_date = date;
  }
  set album_length(double length) {
    this.album_length = length;
  }
  set total_tracks(int songsCount) {
    this._total_tracks = songsCount;
  }
  set genre_id(int id) {
    this._genre_id = id;
  }
  set image_id(int id) {
    this._image_id = id;
  }

  // function to convert class object to map object
  Map<String,dynamic> toMap() {
    Map<String,dynamic> map = Map<String,dynamic>();

    if(this._album_id != null)
      map['album_id'] = this._album_id;
    map['album_name'] = this._album_name;
    map['release_date'] = this._release_date;
    map['album_length'] = this.album_length;
    map['total_tracks'] = this._total_tracks;
    map['genre_id'] = this._genre_id;
    map['image_id'] = this._image_id;

    return map;
  }

  Album.fromMaptoAlbum(Map<String,dynamic> map) {
    this._album_id = map['album_id'];
    this._album_name = map['album_name'];
    this._release_date = map['release_date'];
    this._album_length = map['album_length'];
    this._total_tracks = map['total_tracks'];
    this._genre_id = map['genre_id'];
    this._image_id = map['image_id'];
  }
}