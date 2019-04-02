class Genre {
  // attributes for genre
  int _genre_id;
  String _name;

  // get functions for variables
  int get genre_id => this._genre_id;
  String get name => this._name;

  // set functions for varaibles
  set name(String genre_name) {
    this._name = genre_name;
  }

  // function to convert class object to map object
  Map<String,dynamic> toMap() {
    Map<String,dynamic> map = Map<String,dynamic>();

    map['genre_id'] = this._genre_id;
    map['name'] = this._name;

    return map;
  }

  // function to convert map object to class object
  Genre.fromMaptoGenre(Map<String,dynamic> map) {
    this._genre_id = map['genre_id'];
    this._name = map['name'];
  }
}