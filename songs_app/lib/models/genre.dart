class Genre {
  // attributes for genre
  int _genreId;
  String _name;

  // get functions for variables
  int get genreId => this._genreId;
  String get name => this._name;

  // set functions for varaibles
  set name(String genreName) {
    this._name = genreName;
  }

  // function to convert class object to map object
  Map<String,dynamic> toMap() {
    Map<String,dynamic> map = Map<String,dynamic>();

    map['genreId'] = this._genreId;
    map['name'] = this._name;

    return map;
  }

  // function to convert map object to class object
  Genre.fromMaptoGenre(Map<String,dynamic> map) {
    this._genreId = map['genreId'];
    this._name = map['name'];
  }
}