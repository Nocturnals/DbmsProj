import 'package:songs_app/utils/database_files/tables.dart';

class Triggers {

  // trigger to update artist songs count on insert of a song in songs table
  static String triggerinsertSongOnArtist = 'CREATE TRIGGER ${SongsTable.tableName}_OnInsert_${ArtistTable.tableName} '+
                                            'AFTER INSERT ON ${SongsTable.tableName} '+
                                            'BEGIN '+
                                            'UPDATE ${ArtistTable.tableName} SET ${ArtistTable.colTotalSongs} = ${ArtistTable.colTotalSongs}+1; '+
                                            'END';

  static String triggerinsertSongOnAlbum =  'CREATE TRIGGER ${SongsTable.tableName}_OnInsert_${AlbumsTable.tableName} '+
                                            'AFTER INSERT ON ${SongsTable.tableName} '+
                                            'BEGIN '+
                                            'UPDATE ${AlbumsTable.tableName} SET ${AlbumsTable.colTotalTracks} = ${AlbumsTable.colTotalTracks}+1; '+
                                            'END';
}