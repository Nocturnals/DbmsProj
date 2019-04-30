import 'package:songs_app/models/songs.dart';

import 'package:songs_app/utils/database_files/songbyCRUD.dart';

class SongServies{
  static SongServies _songServies = SongServies._createInstance();

  SongServies._createInstance();

  factory SongServies() {
    return _songServies;
  }
}