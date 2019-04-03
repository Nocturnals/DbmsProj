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
  static String colActiveStatus = 'activeStatus';
  
  // create table command
  static String createTable = 'CREATE TABLE $tableName($colUserId INTEGER AUTOINCREMENT,' +
                      ' $colFirstName TEXT NOT NULL, $colLastName TEXT NOT NULL, ' + 
                      ' $colEmail TEXT NOT NULL, $colGender TEXT NOT NULL, $colDOB TEXT NOT NULL, ' + 
                      '$colLastLogin TEXT NULL, $colActiveStatus TEXT NULL, CONSTRAINT PK_$tableName PRIMARY KEY ($colUserId))';

}

class GenreTable {

  static String tableName = 'Genre';

  // column names
  static String colGenreId = 'genreId';
  static String colName = 'name';

  // create table command
  static String createTable = 'CREATE TABLE $tableName($colGenreId INTEGER NOT NULL AUTOINCREMENT, ' + 
                              '$colName TEXT NOT NULL, CONSTRAINT PK_$tableName PRIMARY KEY ($colGenreId))';

}

class PlaylistTable {

  static String tableName = 'playlists';

  // column names
  static String colPlaylistId = 'playlistId';
  static String colUserId = 'userId';
  static String colName = 'name';

  // create table command
  static String createTable = 'CREATE TABLE $tableName($colPlaylistId INTEGER NOT NULL AUTOINCREMENT, ' + 
                              '$colUserId INT NOT NULL, $colName VARCHAR(30), ' + 
                              'CONSTRAINT PK_$tableName PRIMARY KEY ($colPlaylistId), ' + 
                              'CONSTRAINT FK_${UsersTable.tableName} FOREIGN KEY ($colUserId) '+
                              'REFERENCES ${UsersTable.tableName}(${UsersTable.colUserId})';

}

class Imagestable {

  static String tableName = 'Images';

  // column names
  static String colImageId = 'imageId';
  static String colImgLocation = 'imgLocation';
  static String colName = 'name';

  // create table command
  static String createTable = 'CREATE TABLE $tableName($colImageId INTEGER NOT NULL AUTOINCREMENT, '+
                              '$colImgLocation VARCHAR(300) NOT NULL, $colName VARCHAR(150) NOT NULL, '+
                              'CONSTRAINT PK_$tableName PRIMARY KEY ($colImageId))';

}

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
  static String createTable = 'CREATE TABLE $tableName($colAlbumId INTEGER NOT NULL AUTOINCREMENT, '+
                              '$colAlbumName VARCHAR(200) NOT NULL, '+
                              '$colReleaseDate TEXT NOT NULL,'+
                              '$colAlbumLength REAL DEFAULT 0 NOT NULL,'+
                              '$colTotalTracks INT DEFAULT 0 NOT NULL, '+
                              '$colGenreId INT NOT NULL,'+
                              '$colImageId INT NOT NULL,'+
                              'CONSTRAINT PK_$tableName PRIMARY KEY ($colAlbumId), '+
                              'CONSTRAINT FK_${GenreTable.tableName} FOREIGN KEY ($colGenreId) '+
                              'REFERENCES ${GenreTable.tableName}(${GenreTable.colGenreId}))'; 

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
  static String createTable = 'CREATE TABLE $tableName($colArtistId INTEGER NOT NULL AUTOINCREMENT, '+
                              '$colName VARCHAR(100) NOT NULL, '+
                              '$colTotalSongs INT DEFAULT 0 NOT NULL, '+
                              '$colTotalAlbums INT DEFAULT 0 NOT NULL, '+
                              '$colImageId INT NOT NULL, '+
                              'CONSTRAINT PK_$tableName PRIMARY KEY ($colArtistId), '+
                              'CONSTRAINT FK_${Imagestable.tableName} FOREIGN KEY ($colImageId) '+
                              'REFERENCES ${Imagestable.tableName}(${Imagestable.colImageId}))';

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
  static String createTable = 'CREATE TABLE $tableName($colSongId INTEGER NOT NULL AUTOINCREMENT, '+
                              '$colTitle VARCHAR(300) NOT NULL, '+
                              '$colLength REAL DEFAULT 0 NOT NULL, '+
                              '$colAlbumId INT NOT NULL, '+
                              '$colGenreId INT NOT NULL, '+
                              '$colImageId INT NOT NULL, '+
                              'CONSTRAINT PK_$tableName PRIMARY KEY ($colSongId), '+
                              'CONSTRAINT FK_${AlbumsTable.tableName} FOREIGN KEY ($colAlbumId) '+
                              'REFERENCES ${AlbumsTable.tableName}(${AlbumsTable.colAlbumId}), '+
                              'CONSTRAINT FK_${GenreTable.tableName} FOREIGN KEY ($colGenreId) '+
                              'REFERENCES ${GenreTable.tableName}(${GenreTable.colGenreId}), '+
                              'CONSTRAINT FK_${Imagestable.tableName} FOREIGN KEY ($colImageId) '+
                              'REFERENCES ${Imagestable.tableName}(${Imagestable.colImageId}))';

}

class SongByTable {
  
  static String tableName = 'SongBy';

  // column names
  static String colSongId = 'songId';
  static String colAlbumId = 'albumId';
  static String colArtistId = 'artistId';

  // create table command
  static String createTable = 'CREATE TABLE $tableName($colSongId INTEGER NOT NULL, '+
                              '$colAlbumId INT NOT NULL, '+
                              '$colArtistId INT NOT NULL, '+
                              'CONSTRAINT PK_$tableName PRIMARY KEY ($colSongId), '+
                              'CONSTRAINT FK_${SongsTable.tableName} FOREIGN KEY ($colSongId) '+
                              'REFERENCES ${SongsTable.tableName}(${SongsTable.colSongId}), '+
                              'CONSTRAINT FK_${AlbumsTable.tableName} FOREIGN KEY ($colAlbumId) '+
                              'REFERENCES ${AlbumsTable.tableName}(${AlbumsTable.colAlbumId}), '+
                              'CONSTRAINT FK_${ArtistTable.tableName} FOREIGN KEY ($colArtistId) '+
                              'REFERENCES ${ArtistTable.tableName}(${ArtistTable.colArtistId}))';

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
  static String createTable = 'CREATE TABLE $tableName($colUserId INTEGER NOT NULL, '+
                              '$colSongId INT NOT NULL, '+
                              '$colAlbumId INT NOT NULL, '+
                              '$colCount INT NULL, '+
                              '$colWeekNo INT NULL, '+
                              'CONSTRAINT PK_$tableName PRIMARY KEY ($colUserId,$colSongId), '+
                              'CONSTRAINT FK_${UsersTable.tableName} FOREIGN KEY ($colUserId) '+
                              'REFERENCES ${UsersTable.tableName}(${UsersTable.colUserId}), '+
                              'CONSTRAINT FK_${SongsTable.tableName} FOREIGN KEY ($colSongId) '+
                              'REFERENCES ${SongsTable.tableName}(${SongsTable.colSongId}), '+
                              'CONSTRAINT FK_${AlbumsTable.tableName} FOREIGN KEY ($colAlbumId) '+
                              'REFERENCES ${AlbumsTable.tableName}(${AlbumsTable.colAlbumId}), )';

}

class IncludesTable {

  static String tableName = 'Includes';

  // column names
  static String colIncludesId = 'includesId';
  static String colSongId = 'songId';
  static String colAlbumId = 'albumId';

  // create table command
  static String createTable = 'CREATE TABLE $tableName($colIncludesId INTEGER NOT NULL AUTOINCREMENT, '+
                              '$colSongId INT NOT NULL, '+
                              '$colAlbumId INT NOT NULL, '+
                              'CONSTRAINT PK_$tableName PRIMARY KEY ($colIncludesId), '+
                              'CONSTRAINT FK_${SongsTable.tableName} FOREIGN KEY ($colSongId) '+
                              'REFERENCES ${SongsTable.tableName}(${SongsTable.colSongId}), '+
                              'CONSTRAINT FK_${AlbumsTable.tableName} FOREIGN KEY ($colAlbumId) '+
                              'REFERENCES ${AlbumsTable.tableName}(${AlbumsTable.colAlbumId}))';

}


