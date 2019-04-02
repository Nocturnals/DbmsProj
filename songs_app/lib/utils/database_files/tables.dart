class AlbumsTable {

  static String tableName = 'Albums';

  // column names
  static String colAlbumId = 'albumId';
  static String colAlbumName = 'albumName';
  static String colReleaseDate = 'releaseDate';
  static String colAlbumLength = 'albumLength';
  static String colTotalTracks = 'totalTracks';
  static String colGenreId = 'genreId';
  static String colImageId = 'imageId';

  // create table command
  static String createTable = ''; 

}

class ArtistTable {

  static String tableName = 'Artists';

  // column names
  static String colArtistId = 'artistId';
  static String colName = 'name';
  static String colTotalSongs = 'totalSongs';
  static String colTotalAlbums = 'totalAlbums';
  static String colImageId = 'imageId';

  //create table command
  static String createTable = '';

}

class FrequentlyHeardTable {
  
  static String tableName = 'FrequentlyHeard';

  // column names
  static String colUserId = 'userId';
  static String colSongId = 'songId';
  static String colAlbumId = 'albumId';
  static String colCount = 'count';
  static String colWeekNo = 'weekNo';
  
  // create table command
  static String createTable = '';

}

class GenreTable {

  static String tableName = 'Genre';

  // column names
  static String colGenreId = 'genreId';
  static String colName = 'name';

  // create table command
  static String createTable = '';

}

class Imagestable {

  static String tableName = 'Images';

  // column names
  static String colImageId = 'imageId';
  static String colImgLocation = 'imgLocation';
  static String colName = 'name';

  // create table command
  static String createTable = '';

}

class IncludesTable {

  static String tableName = 'Includes';

  // column names
  static String colIncludesId = 'includesId';
  static String colSongId = 'songId';
  static String colAlbumId = 'albumId';

  // create table command
  static String createTable = '';

}

class PlaylistTable {

  static String tableName = 'playlists';

  // column names
  static String colPlaylistId = 'playlistId';
  static String colUserId = 'userId';
  static String colName = 'name';

  // create table command
  static String createTable = '';

}

class SongByTable {
  
  static String tableName = 'SongBy';

  // column names
  static String colSongId = 'songId';
  static String colAlbumId = 'albumId';
  static String colArtistId = 'artistId';

  // create table command
  static String createTable = '';

}

class SongsTable {

  static String tableName = 'Songs';

  // column names
  static String colSongId = 'songId';
  static String colTitle = 'title';
  static String colLength = 'length';
  static String colAlbumId = 'albumId';
  static String colGenreId = 'genreId';
  static String colImageId = 'imageId';

  // create table command
  static String createTable = '';

}

class UsersTable {

  static String tableName = 'Users';
  
  // column names
  static String colUserId = 'userId';
  static String colFirstName = 'firstName';
  static String colLastName = 'lastName';
  static String colEmail = 'email';
  static String colGender = 'gender';
  static String colDOB = 'dateOfBirth';
  static String colLastLogin = 'lastLogin';
  
  // create table command
  static String createTable = '';

}

