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
    List<User> userList = await UserFirestoreCRUD().getAllUsers();

    for (User user in userList) {
      await UsersCRUD().insertUser(user);
    }
  }
}