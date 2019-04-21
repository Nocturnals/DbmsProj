import 'package:cloud_firestore/cloud_firestore.dart';

// imports of models
import 'package:songs_app/models/users.dart';

// imports of sqlite crud files
import 'package:songs_app/utils/database_files/usersCRUD.dart';

// imports of firestore crud files
import 'package:songs_app/utils/cloudStore_files/usersFirestoreCRUD.dart';

class InitData {
  static InitData _initData;

  InitData._createInstance();

  factory InitData() {
    if (_initData == null) {
      _initData = InitData._createInstance();
      _populateDatatoDatabase();
    }
    return _initData;
  }

  static void _populateDatatoDatabase() async {

    // users table
    print('Addind users collection to user table');
    QuerySnapshot usersDocs = await UserFirestoreCRUD().getAllUsers();

    for (DocumentSnapshot userDoc in usersDocs.documents) {
      User user = User.fromFirestoreMaptoUser(userDoc.data, userDoc.documentID);
      await UsersCRUD().insertUser(user);
    }
  }
}