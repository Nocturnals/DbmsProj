import 'package:songs_app/utils/database_files/tables.dart';

class Views {

  // view to get recent songs
  static String getRecentReleases = 'CREATE VIEW getRecentSongs AS SELECT * FROM ${SongsTable.tableName} WHERE ';

}