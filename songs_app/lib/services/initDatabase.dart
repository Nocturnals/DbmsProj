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
    albumList.add(Album('ackson', DateTime(1950), 0.0, 0, 5, 2));
    albumList.add(Album('Reputation', DateTime(2017), 0.0, 0, 5,3));
    albumList.add(Album('Me & Giuliani Down By the School Yard ', DateTime(1981), 0.0, 0, 1, 4));
    albumList.add(Album('album1', DateTime(1990), 0.0, 0, 1, 5));
    albumList.add(Album('album2', DateTime(2016), 0.0, 0, 1,6));
    albumList.add(Album('album3', DateTime(1975), 0.0, 0, 1, 7));
    albumList.add(Album('album4', DateTime(1958), 0.0, 0, 2, 8));
    albumList.add(Album('album5', DateTime(2017), 0.0, 0, 2,9));
    albumList.add(Album('album6', DateTime(1971), 0.0, 0, 2, 10));
    albumList.add(Album('album7', DateTime(1950), 0.0, 0, 2, 11));
    albumList.add(Album('album8', DateTime(2017), 0.0, 0, 2,12));
    albumList.add(Album('album9', DateTime(1971), 0.0, 0, 3, 13));
    albumList.add(Album('album10', DateTime(1970), 0.0, 0, 3, 14));
    albumList.add(Album('album11', DateTime(2007), 0.0, 0, 3,15));
    albumList.add(Album('album12', DateTime(1979), 0.0, 0, 3, 16));
    albumList.add(Album('album13', DateTime(1950), 0.0, 0, 3, 17));
    albumList.add(Album('album14', DateTime(2011), 0.0, 0, 3,18));
    albumList.add(Album('album15', DateTime(1971), 0.0, 0, 3, 19));
    albumList.add(Album('album16', DateTime(1980), 0.0, 0, 4, 20));
    albumList.add(Album('album17', DateTime(2006), 0.0, 0, 4,21));
    albumList.add(Album('album18', DateTime(1979), 0.0, 0, 4, 22));
    albumList.add(Album('album19', DateTime(1958), 0.0, 0, 4, 23));
    albumList.add(Album('album20', DateTime(2016), 0.0, 0, 4,24));
    albumList.add(Album('album21', DateTime(1985), 0.0, 0, 4, 25));
    albumList.add(Album('album22', DateTime(1995), 0.0, 0, 5, 26));
    albumList.add(Album('album23', DateTime(2002), 0.0, 0, 5,27));
    albumList.add(Album('album24', DateTime(2004), 0.0, 0, 2, 28));
    albumList.add(Album('album25', DateTime(1999), 0.0, 0, 5, 29));
    albumList.add(Album('album26', DateTime(2018), 0.0, 0, 5,30));
    albumList.add(Album('album27', DateTime(1995), 0.0, 0, 5, 31));
    albumList.add(Album('album28', DateTime(1996), 0.0, 0, 5, 32));
    albumList.add(Album('album29', DateTime(2011), 0.0, 0, 5,33));
    albumList.add(Album('album30', DateTime(1981), 0.0, 0, 3, 34));
    albumList.add(Album('album31 ', DateTime(1959), 0.0, 0, 5, 35));
    albumList.add(Album('album32', DateTime(2017), 0.0, 0, 5,36));
    albumList.add(Album('album33', DateTime(1971), 0.0, 0, 1, 37));
    albumList.add(Album('album34', DateTime(1950), 0.0, 0, 5, 38));
    albumList.add(Album('album35', DateTime(2017), 0.0, 0, 5,39));
    albumList.add(Album('album36', DateTime(1971), 0.0, 0, 2, 40));
    albumList.add(Album('album37', DateTime(1950), 0.0, 0, 1, 41));
    albumList.add(Album('album38', DateTime(2017), 0.0, 0, 1,42));
    albumList.add(Album('album39', DateTime(1971), 0.0, 0, 4, 43));
    albumList.add(Album('album40', DateTime(1950), 0.0, 0, 3, 44));
    albumList.add(Album('album41', DateTime(2017), 0.0, 0, 4,45));
    albumList.add(Album('album42', DateTime(1971), 0.0, 0, 1, 46));
    albumList.add(Album('album43', DateTime(1950), 0.0, 0, 5, 47));
    albumList.add(Album('album44', DateTime(2017), 0.0, 0, 2,48));
    albumList.add(Album('album45', DateTime(1971), 0.0, 0, 5, 49));
    albumList.add(Album('album46', DateTime(1950), 0.0, 0, 6, 50));
    albumList.add(Album('album47', DateTime(2017), 0.0, 0, 4,51));
   

    // insert into table
    for(int i=0;i<albumList.length;i++) {
      await AlbumCRUD().insertAlbum(albumList[i]);
    }






    // Artist table
    List<Artist> artistList = List<Artist>();

    // initialize the instances
    artistList.add(Artist('Taylor Swift', 0, 0, 1));
    artistList.add(Artist('Rihanna', 0, 0, 2));
    artistList.add(Artist('Katy Perry',0,0,3));
    artistList.add(Artist('Ariana Grande', 0, 0, 4));
    artistList.add(Artist('Lady Gaga', 0, 0, 5));
    artistList.add(Artist('David Bowie', 0, 0, 6));
    artistList.add(Artist('Demi Lovato', 0, 0, 7));
    artistList.add(Artist('dsp',0,0,8));
    artistList.add(Artist('sid ', 0, 0, 9));
    artistList.add(Artist('sri ram', 0, 0, 10));
    artistList.add(Artist('Miles Davis', 0, 0, 11));
    artistList.add(Artist('Scorpions', 0, 0, 12));
    artistList.add(Artist('Drake',0,0,13));
    artistList.add(Artist('Dio', 0, 0, 14));
    artistList.add(Artist('Slick Rick', 0, 0, 15));
    artistList.add(Artist('Justin Bieber', 0, 0, 16));
    artistList.add(Artist('Eminem', 0, 0, 17));
    artistList.add(Artist('Honey Singh',0,0,18));
    artistList.add(Artist('Arjith Singh', 0, 0, 19));
    artistList.add(Artist('Faust', 0, 0, 20));
    artistList.add(Artist('Billy', 0, 0, 21));
    artistList.add(Artist('killers', 0, 0, 22));
    artistList.add(Artist('Kevin',0,0,23));
    artistList.add(Artist('Peggy', 0, 0, 24));
    artistList.add(Artist('Sublime', 0, 0, 25));

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