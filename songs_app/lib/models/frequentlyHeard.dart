class FrequentlyHeard {

  // FrequentlyHeard attributes 
  int _user_id;
  int _song_id;
  int _album_id;
  int _count;
  int _weekNo;

  // constructor functions
  FrequentlyHeard(this._user_id,this._song_id,this._album_id,this._count,this._weekNo);

  // get functions for variables
  int get user_id => _user_id;
  int get song_id => _song_id;
  int get album_id => _album_id;
  int get count => _count;
  int get weekNo => _weekNo;

  // setter functions for variables
  set user_id(int id) {
    this._user_id = id;
  }
  set song_id(int newsongid) {
    this._song_id = newsongid;
  }
  set album_id(int id) {
    this._album_id = id;
  }
  set count(int newcount) {
    this._count = newcount;
  }
  set weekNo(int newweekNo) {
    this._weekNo = newweekNo;
  }

  // function to convert frequentlyHeard object to map object
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();

    map['user_id'] = this._user_id;
    map['song_id'] = this._song_id;
    map['album_id'] = this._album_id;
    map['count'] = this._count;
    map['weekNo'] = this._weekNo;

    return map;
  }

  // function to convert map object to frequntlyHeard object
  FrequentlyHeard.fromMaptoFrequentlyHeard(Map<String, dynamic> map) {
    this._user_id = map['user_id'];
    this._song_id = map['song_id'];
    this._album_id = map['album_id'];
    this._count = map['count'];
    this._weekNo = map['weekNo'];
  }
}