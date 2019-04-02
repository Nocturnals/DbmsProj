class User {
  
  // User attributes
  int _user_id;
  String _first_name;
  String _last_name;
  String _email;
  String _gender;
  DateTime _date_of_birth;
  DateTime _last_login;

  // Constructor functions
  User(this._first_name,this._last_name,this._email,this._gender,this._date_of_birth,this._last_login);
  User.withId(this._user_id,this._first_name,this._last_name,this._email,this._gender,this._date_of_birth,this._last_login);

  // get functions for variables
  int get user_id {
    return _user_id;
  }
  String get first_name {
    return _first_name;
  }
  String get last_name {
    return _last_name;
  }
  String get email {
    return _email;
  }
  String get gender {
    return _gender;
  }
  DateTime get date_of_birth {
    return _date_of_birth;
  }
  DateTime get last_login {
    return _last_login;
  }

  // setter functions for variables
  set first_name(String fname) {
    this._first_name = fname;
  }
  set last_name(String lname) {
    this._last_name = lname;
  }
  set email(String newEmail) {
    this._email = newEmail;
  }
  set gender(String newGender) {
    this._gender = newGender;
  }
  set date_of_birth(DateTime newdatetime) {
    this._date_of_birth = newdatetime;
  }
  set last_login(DateTime newlastlogin) {
    this._last_login = newlastlogin;
  }

  // function to convert user to map object
  Map<String, dynamic> toMap() {
    Map<String, dynamic> user_map = Map<String, dynamic>();

    if(this._user_id != null)
      user_map['user_id'] = this._user_id;
    user_map['first_name'] = this._first_name;
    user_map['last_name'] = this._last_login;
    user_map['email'] = this._email;
    user_map['gender'] = this._gender;
    user_map['date_of_birth'] = this._date_of_birth;
    user_map['last_login'] = this._last_login;

    return user_map;
  }

  // function to convert map object to user object
  User.fromMaptoUser(Map<String,dynamic> map) {
    this._user_id = map['user_id'];
    this._first_name = map['first_name'];
    this._last_name = map['last_name'];
    this._email = map['email'];
    this._gender = map['gender'];
    this._date_of_birth = map['date_of_birth'];
    this._last_login = map['last_login'];
  }
}