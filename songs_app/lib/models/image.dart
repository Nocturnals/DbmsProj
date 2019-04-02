class Image {
  // Image attributes
  int _imageId;
  String _imgLocation;
  String _name;

  // get functions 
  int get imageId => this._imageId;
  String get imgLocation => this._imgLocation;
  String get name => this._name;

  // setter functions
  set imgLocation(String newLocation) {
    this._imgLocation = newLocation;
  }
  set name(String newName) {
    this._name = newName;
  }

  // function to convert class object to map object
  Map<String,dynamic> toMap() {
    Map<String,dynamic> map = Map<String,dynamic>();

    if(this._imageId != null)
      map['imageId'] = this._imageId;
    map['imgLocation'] = this._imgLocation;
    map['name'] = this._name;

    return map;

  }

  // function to convert map to class object
  Image.fromMaptoImage(Map<String,dynamic> map) {
    this._imageId = map['imageId'];
    this._imgLocation = map['imgLocation'];
    this._name = map['name'];
  }
}