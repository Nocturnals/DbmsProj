class Song{
// Song attributes
int _song_id;
String _title;
double _length;
int _album_id;
bool _downloadPermit;
int _genre_id;
int _image_id;

//Constructor functions
Song(this._title,this._length,this._album_id,this._downloadPermit,this._genre_id,this._image_id);
Song.withId(this._song_id,this._title,this._length,this._album_id,this._downloadPermit,this._genre_id,this._image_id);

// get functions for variables

int get song_id {
  return _song_id;
}

String get title{
  return _title;
}

double get length{
  return _length;
}

int get album_id{
  return _album_id;
}

bool get downloadPermit{
  return _downloadPermit;
}

int get genre_id{
  return _genre_id;
}

int get image_id{
  return _image_id;
}

//setter functions for variables

set song_id(int id){
  this._song_id = id;
}

set title(String title){
  this._title = title;
}

set length(double length){
  this._length = length;
}

set album_id(int album_id){
  this._album_id = album_id;
}

set dowmloadPermit(bool downloadPermit){
  this._downloadPermit = downloadPermit;
}

set genre_id(int genre_id){
  this._genre_id = genre_id;
}


// function to convert song to map object

Map<String , dynamic> toMap(){
  Map<String , dynamic> song_map = Map<String , dynamic>();

  if (this._song_id != null)
    song_map["song_id"] = this._song_id;
  song_map["title"] = this._title;
  song_map["length"] = this._length;
  song_map["album_id"] = this._album_id;
  song_map["downloadPermit"] = this._downloadPermit;
  song_map["genre_id"] = this._genre_id;

  return song_map;
}

//function to convert map object to song object
Song.fromMaptoSong(Map<String,dynamic> map) {
  this._song_id = map["song_id"];
  this._title = map["title"];
  this._length = map["length"];
  this._album_id = map["album_id"];
  this._downloadPermit = map["downloadPermit"];
  this._genre_id = map["genre_id"];

}

}