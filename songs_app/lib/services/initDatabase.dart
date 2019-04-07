// imports of models
import 'package:songs_app/models/users.dart';
import 'package:songs_app/models/genre.dart';
import 'package:songs_app/models/playlist.dart';
import 'package:songs_app/models/image.dart';
import 'package:songs_app/models/albums.dart';
import 'package:songs_app/models/artists.dart';
import 'package:songs_app/models/songs.dart';
import 'package:songs_app/models/songBy.dart';
import 'package:songs_app/models/frequentlyHeard.dart';
import 'package:songs_app/models/includes.dart';

// imports of crud files
import 'package:songs_app/utils/database_files/usersCRUD.dart';
import 'package:songs_app/utils/database_files/genreCRUD.dart';
import 'package:songs_app/utils/database_files/playlistCRUD.dart';
import 'package:songs_app/utils/database_files/imagesCRUD.dart';
import 'package:songs_app/utils/database_files/albumsCRUD.dart';
import 'package:songs_app/utils/database_files/artist.CRUD.dart';
import 'package:songs_app/utils/database_files/songsCRUD.dart';
import 'package:songs_app/utils/database_files/songbyCRUD.dart';
import 'package:songs_app/utils/database_files/frequentlyheardCRUD.dart';
import 'package:songs_app/utils/database_files/includesCRUD.dart';

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
    // Users table
    List<User> userlist = List<User>();

    // strings
    // String firstName = '';
    // String lastName = '';
    // String email = '';
    // List<String> gender = ['male','female'];
    // DateTime dob = DateTime(1999,05,15);
    // DateTime lastLogin = DateTime(2017,01,01);
    // bool activeStatus = true;

    // initialize the instances
    userlist.add(User('Ravi','Vanam','ravi@home.com','male',DateTime(2002,09,09),DateTime(2017,01,01),false));
    userlist.add(User('Chinna','Sheripally','chinna@example.com','male',DateTime(2000,03,14),DateTime(2017,01,01),false));
    

    // insert into table
    for(int i=0;i<userlist.length;i++) {
      await UsersCRUD().insertUser(userlist[i]);
    }

    
    
    
    
    //  genre table
    List<Genre> genreList = List<Genre>();



    // initialize the instances
    genreList.add(Genre('Romantic'));
    genreList.add(Genre('Melody'));
    genreList.add(Genre('KPOP'));
    genreList.add(Genre('EDM'));
    genreList.add(Genre('Rock'));
    genreList.add(Genre('Religious'));
    genreList.add(Genre('OldIsGold'));



    // insert into table
    for(int i=0;i<genreList.length;i++) {
      await GenreCRUD().insertGenre(genreList[i]);
    }






    // playlist table
    List<Playlist> playlistList = List<Playlist>();

    // initialize the instances
    playlistList.add(Playlist(1, 'sleepy'));
    playlistList.add(Playlist(1, 'Anime'));
    playlistList.add(Playlist(2, 'Game of Thrones'));
    playlistList.add(Playlist(2, 'Lazy'));
    playlistList.add(Playlist(2, 'Home'));
    playlistList.add(Playlist(3, 'Hell'));

    // insert into table
    for(int i=0;i<playlistList.length;i++) {
      await PlaylistCRUD().insertPlaylist(playlistList[i]);
    }







    // images table
    List<Images> imagesList = List<Images>();

    // initialize the instances
    imagesList.add(Images('nowhere','god'));
    imagesList.add(Images('no way','satan'));
    imagesList.add(Images('i am here','human'));

    // insert into table
    for(int i=0;i<imagesList.length;i++) {
      await ImagesCRUD().insertImage(imagesList[i]);
    }


    
    
    
    
    
    // Albums table
    List<Album> albumList = List<Album>();

    // initialize the instances
    albumList.add(Album('Eagles', DateTime(1971), 0.0, 0, 5, 1));
    albumList.add(Album('Michel Jackson', DateTime(1950), 0.0, 0, 5, 1));
    albumList.add(Album('Reputation', DateTime(2017), 0.0, 0, 5,2));

    // insert into table
    for(int i=0;i<albumList.length;i++) {
      await AlbumCRUD().insertAlbum(albumList[i]);
    }






    // Artist table
    List<Artist> artistList = List<Artist>();

    // initialize the instances
    artistList.add(Artist('Taylor Swift', 0, 0, 2));
    artistList.add(Artist('Rihanna', 0, 0, 3));
    artistList.add(Artist('Katy Perry',0,0,1));
    artistList.add(Artist('Ariana Grande', 0, 0, 1));
    artistList.add(Artist('Lady Gaga', 0, 0, 1));

    // insert into tables
    for(int i=0;i<artistList.length;i++) {
      await ArtistsCRUD().insertArtist(artistList[i]);
    }






    // songs table
    List<Song> songList = List<Song>();

    // initialize the instances
    songList.add(Song('Ready For It?', 4, 3, 2, 1));
    songList.add(Song('End Game', 1.5,3,2,1));
    songList.add(Song('Look What You Made Me', 1, 3, 2, 1));

    // insert into tables
    for(int i=0;i<songList.length;i++) {
      await SongsCRUD().insertSong(songList[i]);
    }






    // songby table
    List<SongBy> songByList = List<SongBy>();

    //initialize the instances
    songByList.add(SongBy.withId(1,3,1));
    songByList.add(SongBy.withId(2, 3, 1));
    songByList.add(SongBy.withId(3, 3, 1));

    // insert into tables
    for(int i=0;i<songByList.length;i++) {
      await SongByCRUD().insertSongBy(songByList[i]);
    }







    // frequentlyHeard table
    List<FrequentlyHeard> frequentlyHeardList = List<FrequentlyHeard>();

    // initialize the instances
    frequentlyHeardList.add(FrequentlyHeard.withId(1, 3, 3, 5, 3));
    frequentlyHeardList.add(FrequentlyHeard.withId(2, 1, 3, 6, 4));
    frequentlyHeardList.add(FrequentlyHeard.withId(3, 2, 3, 7, 2));

    // insert into tables
    for(int i=0;i<frequentlyHeardList.length;i++) {
      await FrequentlyHeardCRUD().insertFrequentlyHeard(frequentlyHeardList[i]);
    }








    // includes table
    List<Includes> includesList = List<Includes>();

    // creating instances
    includesList.add(Includes.withId(1,1,3));
    includesList.add(Includes.withId(1, 2, 3));
    includesList.add(Includes.withId(2, 3, 4));

    // insert into tables
    for(int i=0;i<includesList.length;i++) {
      await IncludesCRUD().insertIncludes(includesList[i]);
    }

    
    print('Populated the database');
  }
}