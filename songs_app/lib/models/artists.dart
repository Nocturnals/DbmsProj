class Artist{

 // artist attributes
int _artist_id;
String _name;
int _totalSongs;
int _totalAlbums;
int _image_id;

//constructer functions for variables

Artist(this._name,this._totalSongs,this._totalAlbums,this._image_id);
Artist.withId(this._artist_id,this._name,this._totalSongs,this._totalAlbums,this._image_id);

//get function variables

int get artist_id{
  return _artist_id;
}

int get totalSongs{
  return _totalSongs;
}

String get name {
  return _name;
}

int get totalAlbums{
  return _totalAlbums;
}

int get image_id{
  return _image_id;
}

//setter functions for variables

set artist_id(int id){
  this._artist_id = id;
}

set name(String name){
  this._name = name;
}

set totalSongs(int totalSongs){
  this._totalSongs =totalSongs;
}

set totalAlbums(int totalAlbums){
  this._totalAlbums = totalAlbums;
}

set image_id(int image_id){
  this._image_id = image_id;
}


//function to convert artist to map object 
Map<String,dynamic> toMap(){
  Map<String,dynamic> artist_map = Map<String,dynamic>();

if(this._artist_id != null)
  artist_map['artist_id'] = this._artist_id;
artist_map['name'] = this._name;
artist_map['totalSongs'] = this._totalSongs;
artist_map['totalAlbums'] = this._totalAlbums;
artist_map['image_id'] = this._image_id;

return artist_map;

}

//function to convert map object to artist object

Artist.fromMaptoArtist(Map<String,dynamic>map){
  this._artist_id = map['artist_id'];
  this._name  = map['name'];
  this._totalSongs = map['totalSongs'];
  this._totalAlbums = map['totalAlbums'];
  this._image_id  = map['image_id'];
}


}
