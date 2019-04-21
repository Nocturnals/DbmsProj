// import 'dart:math';

// // imports of models
// import 'package:songs_app/models/users.dart';
// import 'package:songs_app/models/genre.dart';
// import 'package:songs_app/models/playlist.dart';
// import 'package:songs_app/models/image.dart';
// import 'package:songs_app/models/albums.dart';
// import 'package:songs_app/models/artists.dart';
// import 'package:songs_app/models/songs.dart';
// import 'package:songs_app/models/songBy.dart';
// import 'package:songs_app/models/frequentlyHeard.dart';
// import 'package:songs_app/models/includes.dart';

// // imports of crud files
// import 'package:songs_app/utils/database_files/usersCRUD.dart';
// import 'package:songs_app/utils/database_files/genreCRUD.dart';
// import 'package:songs_app/utils/database_files/playlistCRUD.dart';
// import 'package:songs_app/utils/database_files/imagesCRUD.dart';
// import 'package:songs_app/utils/database_files/albumsCRUD.dart';
// import 'package:songs_app/utils/database_files/artist.CRUD.dart';
// import 'package:songs_app/utils/database_files/songsCRUD.dart';
// import 'package:songs_app/utils/database_files/songbyCRUD.dart';
// import 'package:songs_app/utils/database_files/frequentlyheardCRUD.dart';
// import 'package:songs_app/utils/database_files/includesCRUD.dart';

// class InitData {
//   static InitData _initData;

//   InitData._createInstance();

//   factory InitData() {
//     if (_initData == null) {
//       _initData = InitData._createInstance();
//       _populateDatatoDatabase();
//     }
//     return _initData;
//   }

//   static void _populateDatatoDatabase() async {
//     // Users table
//     List<User> userlist = List<User>();

//     // initialize the instances
//     String fName = 'firstName';
//     String lName = 'lastName';
//     String emailprfx = 'user';
//     String emailsfx = '@gmail.com';
//     int sufx = 1;
//     int year = 1999;
//     int month = 01;
//     int day = 01;
//     List<String> gender = ['male', 'female'];
//     int opt = 0;
//     List<bool> activeStat = [true, false];
//     for (var i = 0; i < 20; i++) {
//       userlist.add(User(fName + sufx.toString(), lName + sufx.toString(), emailprfx + sufx.toString() + emailsfx,
//                         gender[opt], DateTime(year, month, day), DateTime(year+10, month, day), activeStat[opt]));
//       sufx += 1;
//       if ((i % 5) == 0 ) {
//         year += 1;
//       }
//       if ((i % 3) == 0) {
//         month += 1;
//       }
//       if ((i % 2) == 0) {
//         day += 1;
//       }
//       opt = (i+1) % 2;
//     }


//     // insert into table
//     for(int i=0;i<userlist.length;i++) {
//       await UsersCRUD().insertUser(userlist[i]);
//     }

    
    
    
    
//     //  genre table
//     List<Genre> genreList = List<Genre>();



//     // initialize the instances
//     genreList.add(Genre('Romantic'));
//     genreList.add(Genre('Melody'));
//     genreList.add(Genre('KPOP'));
//     genreList.add(Genre('EDM'));
//     genreList.add(Genre('Rock'));
//     genreList.add(Genre('Religious'));
//     genreList.add(Genre('OldIsGold'));



//     // insert into table
//     for(int i=0;i<genreList.length;i++) {
//       await GenreCRUD().insertGenre(genreList[i]);
//     }






//     // playlist table
//     List<Playlist> playlistList = List<Playlist>();

//     // initialize the instances
//     playlistList.add(Playlist(1, 'sleepy'));
//     playlistList.add(Playlist(1, 'Anime'));
//     playlistList.add(Playlist(2, 'Game of Thrones'));
//     playlistList.add(Playlist(2, 'Lazy'));
//     playlistList.add(Playlist(2, 'Home'));
//     playlistList.add(Playlist(3, 'Hell'));

//     // insert into table
//     for(int i=0;i<playlistList.length;i++) {
//       await PlaylistCRUD().insertPlaylist(playlistList[i]);
//     }







//     // images table 200
//     List<Images> imagesList = List<Images>();

//     // initialize the instances
//     String imgLoc = 'location';
//     String imgName = 'image';
//     sufx = 1;
//     for (var i = 0; i < 200; i++) {
//       imagesList.add(Images(imgLoc + sufx.toString(), imgName + sufx.toString()));
//       sufx += 1;
//     }

//     // insert into table
//     for(int i=0;i<imagesList.length;i++) {
//       await ImagesCRUD().insertImage(imagesList[i]);
//     }


    
    
    
    
    
//     // Albums table
//     List<Album> albumList = List<Album>();

//     // initialize the instances
//     albumList.add(Album('Eagles', DateTime(1971), 0.0, 0, 5, 1));
//     albumList.add(Album('ackson', DateTime(1950), 0.0, 0, 5, 2));
//     albumList.add(Album('Reputation', DateTime(2017), 0.0, 0, 5,3));
//     albumList.add(Album('Me & Giuliani Down By the School Yard ', DateTime(1981), 0.0, 0, 1, 4));
//     albumList.add(Album('album1', DateTime(1990), 0.0, 0, 1, 5));
//     albumList.add(Album('album2', DateTime(2016), 0.0, 0, 1,6));
//     albumList.add(Album('album3', DateTime(1975), 0.0, 0, 1, 7));
//     albumList.add(Album('album4', DateTime(1958), 0.0, 0, 2, 8));
//     albumList.add(Album('album5', DateTime(2017), 0.0, 0, 2,9));
//     albumList.add(Album('album6', DateTime(1971), 0.0, 0, 2, 10));
//     albumList.add(Album('album7', DateTime(1950), 0.0, 0, 2, 11));
//     albumList.add(Album('album8', DateTime(2017), 0.0, 0, 2,12));
//     albumList.add(Album('album9', DateTime(1971), 0.0, 0, 3, 13));
//     albumList.add(Album('album10', DateTime(1970), 0.0, 0, 3, 14));
//     albumList.add(Album('album11', DateTime(2007), 0.0, 0, 3,15));
//     albumList.add(Album('album12', DateTime(1979), 0.0, 0, 3, 16));
//     albumList.add(Album('album13', DateTime(1950), 0.0, 0, 3, 17));
//     albumList.add(Album('album14', DateTime(2011), 0.0, 0, 3,18));
//     albumList.add(Album('album15', DateTime(1971), 0.0, 0, 3, 19));
//     albumList.add(Album('album16', DateTime(1980), 0.0, 0, 4, 20));
//     albumList.add(Album('album17', DateTime(2006), 0.0, 0, 4,21));
//     albumList.add(Album('album18', DateTime(1979), 0.0, 0, 4, 22));
//     albumList.add(Album('album19', DateTime(1958), 0.0, 0, 4, 23));
//     albumList.add(Album('album20', DateTime(2016), 0.0, 0, 4,24));
//     albumList.add(Album('album21', DateTime(1985), 0.0, 0, 4, 25));
//     albumList.add(Album('album22', DateTime(1995), 0.0, 0, 5, 26));
//     albumList.add(Album('album23', DateTime(2002), 0.0, 0, 5,27));
//     albumList.add(Album('album24', DateTime(2004), 0.0, 0, 2, 28));
//     albumList.add(Album('album25', DateTime(1999), 0.0, 0, 5, 29));
//     albumList.add(Album('album26', DateTime(2018), 0.0, 0, 5,30));
//     albumList.add(Album('album27', DateTime(1995), 0.0, 0, 5, 31));
//     albumList.add(Album('album28', DateTime(1996), 0.0, 0, 5, 32));
//     albumList.add(Album('album29', DateTime(2011), 0.0, 0, 5,33));
//     albumList.add(Album('album30', DateTime(1981), 0.0, 0, 3, 34));
//     albumList.add(Album('album31 ', DateTime(1959), 0.0, 0, 5, 35));
//     albumList.add(Album('album32', DateTime(2017), 0.0, 0, 5,36));
//     albumList.add(Album('album33', DateTime(1971), 0.0, 0, 1, 37));
//     albumList.add(Album('album34', DateTime(1950), 0.0, 0, 5, 38));
//     albumList.add(Album('album35', DateTime(2017), 0.0, 0, 5,39));
//     albumList.add(Album('album36', DateTime(1971), 0.0, 0, 2, 40));
//     albumList.add(Album('album37', DateTime(1950), 0.0, 0, 1, 41));
//     albumList.add(Album('album38', DateTime(2017), 0.0, 0, 1,42));
//     albumList.add(Album('album39', DateTime(1971), 0.0, 0, 4, 43));
//     albumList.add(Album('album40', DateTime(1950), 0.0, 0, 3, 44));
//     albumList.add(Album('album41', DateTime(2017), 0.0, 0, 4,45));
//     albumList.add(Album('album42', DateTime(1971), 0.0, 0, 1, 46));
//     albumList.add(Album('album43', DateTime(1950), 0.0, 0, 5, 47));
//     albumList.add(Album('album44', DateTime(2017), 0.0, 0, 2,48));
//     albumList.add(Album('album45', DateTime(1971), 0.0, 0, 5, 49));
//     albumList.add(Album('album46', DateTime(1950), 0.0, 0, 6, 50));
//     albumList.add(Album('album47', DateTime(2017), 0.0, 0, 4,51));
   

//     // insert into table
//     for(int i=0;i<albumList.length;i++) {
//       await AlbumCRUD().insertAlbum(albumList[i]);
//     }






//     // Artist table
//     List<Artist> artistList = List<Artist>();

//     // initialize the instances
//     artistList.add(Artist('Taylor Swift', 0, 0, 1));
//     artistList.add(Artist('Rihanna', 0, 0, 2));
//     artistList.add(Artist('Katy Perry',0,0,3));
//     artistList.add(Artist('Ariana Grande', 0, 0, 4));
//     artistList.add(Artist('Lady Gaga', 0, 0, 5));
//     artistList.add(Artist('David Bowie', 0, 0, 6));
//     artistList.add(Artist('Demi Lovato', 0, 0, 7));
//     artistList.add(Artist('dsp',0,0,8));
//     artistList.add(Artist('sid ', 0, 0, 9));
//     artistList.add(Artist('sri ram', 0, 0, 10));
//     artistList.add(Artist('Miles Davis', 0, 0, 11));
//     artistList.add(Artist('Scorpions', 0, 0, 12));
//     artistList.add(Artist('Drake',0,0,13));
//     artistList.add(Artist('Dio', 0, 0, 14));
//     artistList.add(Artist('Slick Rick', 0, 0, 15));
//     artistList.add(Artist('Justin Bieber', 0, 0, 16));
//     artistList.add(Artist('Eminem', 0, 0, 17));
//     artistList.add(Artist('Honey Singh',0,0,18));
//     artistList.add(Artist('Arjith Singh', 0, 0, 19));
//     artistList.add(Artist('Faust', 0, 0, 20));
//     artistList.add(Artist('Billy', 0, 0, 21));
//     artistList.add(Artist('killers', 0, 0, 22));
//     artistList.add(Artist('Kevin',0,0,23));
//     artistList.add(Artist('Peggy', 0, 0, 24));
//     artistList.add(Artist('Sublime', 0, 0, 25));

//     // insert into tables
//     for(int i=0;i<artistList.length;i++) {
//       await ArtistsCRUD().insertArtist(artistList[i]);
//     }






//     // songs table
//     List<Song> songlist = List<Song>();

//     // initialize the instances
//     songlist.add(Song('Ready For It?', 4, 3, 2, 1));
//     songlist.add(Song('End Game', 1.5,3,2,1));
//     songlist.add(Song('Look What You Made Me', 1, 3, 2, 1));
//     songlist.add(Song('Kalapila', 7, 42, 3, 2));
//     songlist.add(Song('Nente', 7, 8, 1, 10));
//     songlist.add(Song('Ammomma', 6, 6, 3, 22));
//     songlist.add(Song('Chathu', 1, 23, 3, 16));
//     songlist.add(Song('Aliyaa', 7, 4, 3, 47));
//     songlist.add(Song('This Is Forever', 2, 24, 3, 25));
//     songlist.add(Song('Thousand Years', 7, 33, 3, 17));
//     songlist.add(Song('Bohemian Rhapsody', 2, 46, 5, 33));
//     songlist.add(Song('Queen', 7, 33, 1, 12));
//     songlist.add(Song('We Are Champions', 6, 38, 7, 46));
//     songlist.add(Song('We Will Rock You', 5, 20, 6, 6));
//     songlist.add(Song('How Far Ill Go', 2, 1, 7, 47));
//     songlist.add(Song('Out Of Love', 3, 49, 2, 25));
//     songlist.add(Song('This is Berk', 7, 21, 4, 22));
//     songlist.add(Song('Killing Me Softly', 2, 28, 7, 15));
//     songlist.add(Song('Tightrope', 4, 15, 3, 12));
//     songlist.add(Song('Rewrite The Stars', 6, 4, 5, 1));
//     songlist.add(Song('Highway to Hell', 4, 1, 4, 11));
//     songlist.add(Song('Back In Black', 3, 27, 3, 49));
//     songlist.add(Song('Heroes Rise', 6, 43, 5, 6));
//     songlist.add(Song('Blue Bird', 2, 15, 4, 29));
//     songlist.add(Song('Come Alive', 2, 39, 7, 3));
//     songlist.add(Song('From Now On', 6, 26, 7, 32));
//     songlist.add(Song('Girls Like You', 7, 5, 3, 42));
//     songlist.add(Song('Payphone', 5, 19, 7, 12));
//     songlist.add(Song('All Time Low', 5, 35, 1, 12));
//     songlist.add(Song('Uptown Funk', 4, 34, 3, 18));
//     songlist.add(Song('Never Enough', 4, 45, 7, 10));
//     songlist.add(Song('Mist Of Capricorn', 3, 34, 1, 21));
//     songlist.add(Song('Swans Of Saraswati', 6, 31, 7, 21));
//     songlist.add(Song('The Greatest Show', 4, 13, 5, 1));
//     songlist.add(Song('The Other Side', 4, 50, 3, 36));
//     songlist.add(Song('Unravel', 2, 49, 2, 20));
//     songlist.add(Song('Sugar', 3, 19, 7, 12));
//     songlist.add(Song('Animals', 1, 41, 7, 22));
//     songlist.add(Song('Comng Home', 3, 32, 6, 19));
//     songlist.add(Song('Coming Home Part II', 2, 12, 6, 21));
//     songlist.add(Song('Divinity', 4, 41, 2, 49));
//     songlist.add(Song('How Deep Is Your Love', 4, 46, 1, 19));
//     songlist.add(Song('Shallow', 4, 14, 2, 15));
//     songlist.add(Song('Always Remember Us This Way', 7, 19, 6, 5));
//     songlist.add(Song('Rolling In The Deep', 5, 44, 1, 26));
//     songlist.add(Song('Someone Like You', 7, 29, 1, 6));
//     songlist.add(Song('Hello', 1, 13, 6, 39));
//     songlist.add(Song('Something Just Like This', 2, 37, 7, 4));
//     songlist.add(Song('The Scientist', 2, 2, 7, 50));
//     songlist.add(Song('Sweet Child O Mine', 4, 13, 6, 31));
//     songlist.add(Song('Here', 5, 27, 1, 43));
//     songlist.add(Song('Perfect', 7, 28, 6, 14));
//     songlist.add(Song('Lost Without You', 6, 6, 6, 4));
//     songlist.add(Song('Say You Wont Let Go', 7, 30, 3, 2));
//     songlist.add(Song('Be Alright', 1, 47, 6, 35));
//     songlist.add(Song('Silhouette', 7, 22, 4, 45));
//     songlist.add(Song('Leave A Light On', 1, 42, 3, 47));
//     songlist.add(Song('Liar', 3, 50, 2, 28));
//     songlist.add(Song('Sober', 3, 6, 4, 12));
//     songlist.add(Song('No Right To Love', 3, 20, 2, 40));
//     songlist.add(Song('Keep You Dry', 2, 38, 6, 22));
//     songlist.add(Song('Somebody To You', 5, 19, 2, 18));
//     songlist.add(Song('This Town', 6, 23, 2, 16));
//     songlist.add(Song('Better in Time', 1, 27, 6, 34));
//     songlist.add(Song('Close', 5, 33, 5, 23));
//     songlist.add(Song('Closer', 2, 38, 2, 23));
//     songlist.add(Song('Make You Feel My Love', 1, 1, 3, 25));
//     songlist.add(Song('Cant Help Falling In Love', 6, 41, 5, 33));
//     songlist.add(Song('Love Me Now', 7, 23, 5, 9));
//     songlist.add(Song('How Long Will I Love You', 5, 24, 4, 7));
//     songlist.add(Song('Girl Crush', 3, 31, 3, 29));
//     songlist.add(Song('I Like Me Better', 2, 4, 1, 28));
//     songlist.add(Song('High Hope', 2, 50, 2, 45));
//     songlist.add(Song('Photograph', 3, 8, 6, 19));
//     songlist.add(Song('Turning Tables', 6, 29, 7, 20));
//     songlist.add(Song('All of Me', 4, 16, 2, 50));
//     songlist.add(Song('Gravity', 5, 21, 7, 19));
//     songlist.add(Song('All I Want', 6, 46, 2, 1));
//     songlist.add(Song('If I Aint Got You', 3, 27, 1, 38));
//     songlist.add(Song('Every Breath You Take', 4, 8, 2, 12));
//     songlist.add(Song('Location', 2, 32, 4, 50));
//     songlist.add(Song('Bubbly', 3, 32, 4, 14));
//     songlist.add(Song('Lost Stars', 4, 41, 6, 17));
//     songlist.add(Song('Chasing Cars', 2, 27, 3, 33));
//     songlist.add(Song('Marry Me', 5, 25, 1, 26));
//     songlist.add(Song('Like Im Gonna Lose You', 4, 1, 3, 42));
//     songlist.add(Song('Say You Love Me', 4, 27, 2, 22));
//     songlist.add(Song('Cherry Wine', 4, 37, 3, 31));
//     songlist.add(Song('Paperweight', 2, 13, 1, 18));
//     songlist.add(Song('Free Fallin', 2, 32, 2, 36));
//     songlist.add(Song('Night Changes', 1, 17, 2, 31));
//     songlist.add(Song('Poison And Wine', 1, 16, 6, 26));
//     songlist.add(Song('The Heart of Life', 4, 14, 6, 22));
//     songlist.add(Song('Better Together', 4, 12, 1, 26));
//     songlist.add(Song('Hold You In My Arms', 7, 8, 3, 42));
//     songlist.add(Song('Dust To Dust', 1, 31, 4, 11));
//     songlist.add(Song('Collide', 2, 40, 3, 45));
//     songlist.add(Song('Latch', 3, 2, 5, 42));
//     songlist.add(Song('First Day Of My Life', 7, 41, 2, 40));
//     songlist.add(Song('Stuck With Me', 5, 42, 1, 23));
//     songlist.add(Song('Do You Remember', 5, 46, 5, 4));
//     songlist.add(Song('Wonderwall', 5, 5, 4, 37));
//     songlist.add(Song('Not Today', 4, 42, 3, 25));


//     // insert into tables
//     for(int i=0;i<songlist.length;i++) {
//       await SongsCRUD().insertSong(songlist[i]);
//     }






//     // songby table
//     List<SongBy> songByList = List<SongBy>();

//     //initialize the instances
//     songByList.add(SongBy.withId(1,3,1));
//     songByList.add(SongBy.withId(2, 3, 1));
//     songByList.add(SongBy.withId(3, 3, 1));
//     songByList.add(SongBy.withId(4, 42, 1));
//     songByList.add(SongBy.withId(5, 8, 1));
//     songByList.add(SongBy.withId(6, 6, 1));
//     songByList.add(SongBy.withId(7, 23, 1));
//     songByList.add(SongBy.withId(8, 4, 1));
//     songByList.add(SongBy.withId(9, 24, 1));
//     songByList.add(SongBy.withId(10, 33, 1));
//     songByList.add(SongBy.withId(11, 46, 1));
//     songByList.add(SongBy.withId(12, 33, 1));
//     songByList.add(SongBy.withId(13, 38, 1));
//     songByList.add(SongBy.withId(14, 20, 1));
//     songByList.add(SongBy.withId(15, 1, 1));
//     songByList.add(SongBy.withId(16, 49, 1));
//     songByList.add(SongBy.withId(17, 21, 1));
//     songByList.add(SongBy.withId(18, 28, 1));
//     songByList.add(SongBy.withId(19, 15, 1));
//     songByList.add(SongBy.withId(20, 4, 1));
//     songByList.add(SongBy.withId(21, 1, 1));
//     songByList.add(SongBy.withId(22, 27, 1));
//     songByList.add(SongBy.withId(23, 43, 1));
//     songByList.add(SongBy.withId(24, 15, 1));
//     songByList.add(SongBy.withId(25, 39, 1));
//     songByList.add(SongBy.withId(26, 26, 1));
//     songByList.add(SongBy.withId(27, 5, 1));
//     songByList.add(SongBy.withId(28, 19, 1));
//     songByList.add(SongBy.withId(29, 35, 1));
//     songByList.add(SongBy.withId(30, 34, 1));
//     songByList.add(SongBy.withId(31, 45, 1));
//     songByList.add(SongBy.withId(32, 34, 1));
//     songByList.add(SongBy.withId(33, 31, 1));
//     songByList.add(SongBy.withId(34, 13, 1));
//     songByList.add(SongBy.withId(35, 50, 1));
//     songByList.add(SongBy.withId(36, 49, 1));
//     songByList.add(SongBy.withId(37, 19, 1));
//     songByList.add(SongBy.withId(38, 41, 1));
//     songByList.add(SongBy.withId(39, 32, 1));
//     songByList.add(SongBy.withId(40, 12, 1));
//     songByList.add(SongBy.withId(41, 41, 1));
//     songByList.add(SongBy.withId(42, 46, 1));
//     songByList.add(SongBy.withId(43, 14, 1));
//     songByList.add(SongBy.withId(44, 19, 1));
//     songByList.add(SongBy.withId(45, 44, 1));
//     songByList.add(SongBy.withId(46, 29, 1));
//     songByList.add(SongBy.withId(47, 13, 1));
//     songByList.add(SongBy.withId(48, 37, 1));
//     songByList.add(SongBy.withId(49, 2, 1));
//     songByList.add(SongBy.withId(50, 13, 1));
//     songByList.add(SongBy.withId(51, 27, 1));
//     songByList.add(SongBy.withId(52, 28, 1));
//     songByList.add(SongBy.withId(53, 6, 1));
//     songByList.add(SongBy.withId(54, 30, 1));
//     songByList.add(SongBy.withId(55, 47, 1));
//     songByList.add(SongBy.withId(56, 22, 1));
//     songByList.add(SongBy.withId(57, 42, 1));
//     songByList.add(SongBy.withId(58, 50, 1));
//     songByList.add(SongBy.withId(59, 6, 1));
//     songByList.add(SongBy.withId(60, 20, 1));
//     songByList.add(SongBy.withId(61, 38, 1));
//     songByList.add(SongBy.withId(62, 19, 1));
//     songByList.add(SongBy.withId(63, 23, 1));
//     songByList.add(SongBy.withId(64, 27, 1));
//     songByList.add(SongBy.withId(65, 33, 1));
//     songByList.add(SongBy.withId(66, 38, 1));
//     songByList.add(SongBy.withId(67, 1, 1));
//     songByList.add(SongBy.withId(68, 41, 1));
//     songByList.add(SongBy.withId(69, 23, 1));
//     songByList.add(SongBy.withId(70, 24, 1));
//     songByList.add(SongBy.withId(71, 31, 1));
//     songByList.add(SongBy.withId(72, 4, 1));
//     songByList.add(SongBy.withId(73, 50, 1));
//     songByList.add(SongBy.withId(74, 8, 1));
//     songByList.add(SongBy.withId(75, 29, 1));
//     songByList.add(SongBy.withId(76, 16, 1));
//     songByList.add(SongBy.withId(77, 21, 1));
//     songByList.add(SongBy.withId(78, 46, 1));
//     songByList.add(SongBy.withId(79, 27, 1));
//     songByList.add(SongBy.withId(80, 8, 1));
//     songByList.add(SongBy.withId(81, 32, 1));
//     songByList.add(SongBy.withId(82, 32, 1));
//     songByList.add(SongBy.withId(83, 41, 1));
//     songByList.add(SongBy.withId(84, 27, 1));
//     songByList.add(SongBy.withId(85, 25, 1));
//     songByList.add(SongBy.withId(86, 1, 1));
//     songByList.add(SongBy.withId(87, 27, 1));
//     songByList.add(SongBy.withId(88, 37, 1));
//     songByList.add(SongBy.withId(89, 13, 1));
//     songByList.add(SongBy.withId(90, 32, 1));
//     songByList.add(SongBy.withId(91, 17, 1));
//     songByList.add(SongBy.withId(92, 16, 1));
//     songByList.add(SongBy.withId(93, 14, 1));
//     songByList.add(SongBy.withId(94, 1, 1));
//     songByList.add(SongBy.withId(95, 8, 1));
//     songByList.add(SongBy.withId(96, 31, 1));
//     songByList.add(SongBy.withId(97, 40, 1));
//     songByList.add(SongBy.withId(98, 2, 1));
//     songByList.add(SongBy.withId(99, 41, 1));
//     songByList.add(SongBy.withId(100, 42, 1));
//     songByList.add(SongBy.withId(101, 46, 1));
//     songByList.add(SongBy.withId(102, 5, 1));
//     songByList.add(SongBy.withId(103, 42, 1));

    

//     // insert into tables
//     for(int i=0;i<songByList.length;i++) {
//       await SongByCRUD().insertSongBy(songByList[i]);
//     }







//     // frequentlyHeard table 10 per user
//     List<FrequentlyHeard> frequentlyHeardList = List<FrequentlyHeard>();

//     // initialize the instances
//     int userId = 1;
//     // 100
//     int songId = 1; 
//     // 50
//     int albumId = 1;
//     int count;
//     int weekNo;
//     for (var i = 0; i < 20; i++) {
//       for (var j = 0; j < 10; j++) {
//         count =Random().nextInt(20);
//         weekNo =Random().nextInt(10);
//         frequentlyHeardList.add(FrequentlyHeard.withId(userId, songId, albumId, count, weekNo));
//         songId = (songId+1) % 101;
//         albumId = (albumId+1) % 51;
//       }
//       userId += 1;
//     }

//     // insert into tables
//     for(int i=0;i<frequentlyHeardList.length;i++) {
//       await FrequentlyHeardCRUD().insertFrequentlyHeard(frequentlyHeardList[i]);
//     }








//     // includes table 10 per playlist
//     List<Includes> includesList = List<Includes>();

//     // creating instances
//     int includesId = 1;
//     songId = 1;
//     albumId = 1;
//     for (var i = 0; i < 6; i++) {
//       for (var i = 0; i < 20; i++) {
//         includesList.add(Includes.withId(includesId, songId, albumId));
//         songId = (songId+1) % 101;
//         albumId = (albumId+1) % 51;
//       }
//       includesId += 1;
//     }

//     // insert into tables
//     for(int i=0;i<includesList.length;i++) {
//       await IncludesCRUD().insertIncludes(includesList[i]);
//     }

//     var result = await UsersCRUD().getTotalUserCount();
//     print('No of users: $result');
//     print('Populated the database');
//   }
// }