class User {
  
  // User attributes
  int _userId;
  String _firstName;
  String _lastName;
  String _email;
  String _gender;
  DateTime _dateOfBirth;
  DateTime _lastLogin;

  // Constructor functions
  User(this._firstName,this._lastName,this._email,this._gender,this._dateOfBirth,this._lastLogin);
  User.withId(this._userId,this._firstName,this._lastName,this._email,this._gender,this._dateOfBirth,this._lastLogin);

  // get functions for variables
  int get userId {
    return _userId;
  }
  String get firstName {
    return _firstName;
  }
  String get lastName {
    return _lastName;
  }
  String get email {
    return _email;
  }
  String get gender {
    return _gender;
  }
  DateTime get dateOfBirth {
    return _dateOfBirth;
  }
  DateTime get lastLogin {
    return _lastLogin;
  }

  // setter functions for variables
  set firstName(String fname) {
    this._firstName = fname;
  }
  set lastName(String lname) {
    this._lastName = lname;
  }
  set email(String newEmail) {
    this._email = newEmail;
  }
  set gender(String newGender) {
    this._gender = newGender;
  }
  set dateOfBirth(DateTime newdatetime) {
    this._dateOfBirth = newdatetime;
  }
  set lastLogin(DateTime newlastlogin) {
    this._lastLogin = newlastlogin;
  }

  // function to convert user to map object
  Map<String, dynamic> toMap() {
    Map<String, dynamic> userMap = Map<String, dynamic>();

    if(this._userId != null)
      userMap['userId'] = this._userId;
    userMap['firstName'] = this._firstName;
    userMap['lastName'] = this._lastName;
    userMap['email'] = this._email;
    userMap['gender'] = this._gender;
    userMap['dateOfBirth'] = this._dateOfBirth;
    userMap['lastLogin'] = this._lastLogin;

    return userMap;
  }

  // function to convert map object to user object
  User.fromMaptoUser(Map<String,dynamic> map) {
    this._userId = map['userId'];
    this._firstName = map['firstName'];
    this._lastName = map['lastName'];
    this._email = map['email'];
    this._gender = map['gender'];
    this._dateOfBirth = map['dateOfBirth'];
    this._lastLogin = map['lastLogin'];
  }
}