import 'package:flutter/material.dart';

import 'package:songs_app/app screens/playlists_class.dart';
// import 'package:songs_app/services/authentication.dart';

import 'package:songs_app/app screens/now_playing.dart';
import 'package:songs_app/app screens/titles.dart';

import 'package:songs_app/app screens/home/widgets.dart';
import 'package:songs_app/app screens/home/generateSongs.dart';


/// Communicates the current state of the audio player.
enum PlayerState {
  /// Player is stopped. No file is loaded to the player. Calling [resume] or [pause] will result in exception.
  STOPPED,
  /// Currently playing a file. The user can [pause], [resume] or [stop] the playback.
  PLAYING,
  /// Paused. The user can [resume] the playback without providing the URL.
  PAUSED,
  /// The playback has been completed. This state is the same as [STOPPED]
  COMPLETED,
}


// -------------------------------------------------------- //
// Home Widget...
class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin<Home>{

  PlayerState playerState;
  TabController tabController;

  List<List> songs = createSongs();

  // Populating PlayLists...
  List<List> playlists = populatePlaylists();
  List playlist = List();

  // Current Playing Song...
  List currSong = List();

  // Colors and theme...
  MaterialColor color = Colors.teal;
  bool firstIndex = true, secondIndex, thirdIndex;

  @override
  void initState() {

    super.initState();
    tabController = TabController(vsync: this, length: 3)
    ..addListener(() {
      setState(() {
        switch (tabController.index) {
          case 0:
            color = Colors.teal;
            firstIndex = true;
            secondIndex = false;
            thirdIndex = false;
            break;
          case 1:
            color = Colors.pink;
            firstIndex = false;
            secondIndex = true;
            thirdIndex = false;
            break;
          case 2:
            color = Colors.blue;
            firstIndex = false;
            secondIndex = false;
            thirdIndex = true;
            break;
        }
      });
    });
    // initPlatformState();

  }

  @override
  void dispose() {
    super.dispose();
    // songData.audioPlayer.stop();
    tabController.dispose();
  }

/// Controlling State of Song...
  /// [PlayerState] = [PLAYING] ...
  void setPlayingState() {
    setState(() {
      playerState = PlayerState.PLAYING;
    });
  }

  /// [PlayerState] = [PAUSED] ...
  void setPauseState() {
    setState(() {
      playerState = PlayerState.PAUSED;
    });
  }

  /// [PlayerState] = [COMPLETED] ...
  void setCompletedState() {
    setState(() {
      playerState = PlayerState.COMPLETED;
    });
  }



  @override
  Widget build(BuildContext context) {

    Map<String, dynamic> args = {
      'tabController': tabController,
      'songName': currSong[0],
      'albumName': currSong[3].toString(),
      'artistName': currSong[2].toString(),
      'artistImage': currSong[2].toString(),
      'songLength': currSong[1],
      'playlists': playlists,
      'playlist': playlist,
      'currSong': currSong,
      'playerState': playerState,
    };


    return DefaultTabController(

      length: 3,
      
      child: Stack(
        children: <Widget>[
          
          Container(
            child: Image.asset('assets/msc-bg-3.jpg', fit: BoxFit.cover, width: double.infinity, height: 250,),
          ),
          
          Scaffold(

            backgroundColor: Colors.transparent,

            drawer: HomeScreenWidgets().sideDrawer(context),
            
            appBar: HomeScreenWidgets().appBar(context, tabController, color),
            
            body: TabBarView(

              controller: tabController,
              children: <Widget>[

                popularSongsWidget(),
                currSong.length == 0
                ?
                Center(
                  child: Text('Play any song.', style: TextStyle(color: Colors.white, fontSize: 30, fontFamily: 'Magnificent'),),
                )
                :
                NowPlayingWidget(
                  fullScreenOn: false,
                  
                ),
                playlistWidget(),

              ],
            
            ),

          ),

        ],
      ),

    );
  }


// Widgets-------------------------------------------------------------------------------------------------------------------
  /// [Popular Songs Widget] ...
  Widget popularSongsWidget() {
    return Container(
      child: ListView(
        scrollDirection: Axis.vertical,
        
        children: <Widget>[

          sortedSongsTitles('Top Releases'),
          topRelease(),

        ],
      ),

      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.teal[400],
            width: 3.0,
            style: BorderStyle.solid
          )
        )
      ),
    );
  }


  /// [Playlist Widget] ...
  Widget playlistWidget() {
    return Container(
      child: ListView(

        scrollDirection: Axis.vertical,
        children: <Widget>[

          // Recently Played...
          sortedSongsTitles('Recently Played'),
          recentlyPlayed(),

          // Playlists...
          sortedSongsTitles('Your Playlists'),
          playlistsWidget(),

        ],

      ),
      decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.blue, width: 3.0, style: BorderStyle.solid))),
    );
  }


// Sub Widgets-----------------------------------------------------------------------------------------------------------------------------

  // Recently Played...
  Widget recentlyPlayed() {
    return Container(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: songs.length,
        itemBuilder: (BuildContext context, int index) {
          String songName = '';
          for (var i = 0; i < 16; i++) {
            songName += songs[index][0][i];
          }
          songName += '...';
          return Container(
            child: SizedBox(
              width: 140,
              child: Card(
                child: Column(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(top: 30, right: 3),
                        child: IconButton(
                          padding: EdgeInsets.only(left: 0),
                          icon: Icon(
                            Icons.play_arrow,
                            size: 50,
                            color: Colors.orangeAccent,
                          ),
                          onPressed: () {
                            debugPrint('Cannot Play this playlist!');
                            currSong.clear();
                            currSong = songs[index].toList();
                            playlist = PlaylistClass('Random', playlists.length, createSongs()).fromPlaylisttoList();
                            navigateToNowPlaying(context);
                          },
                        )),
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 12),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.music_note,
                            size: 12.5,
                            color: Colors.blueAccent,
                          ),
                          Text(
                            songName,
                            style: TextStyle(
                                fontSize: 11,
                                fontFamily: 'Gothic',
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Playlists...
  Widget playlistsWidget() {
    return Container(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: playlists.length,
        itemBuilder: (BuildContext context, int index) {
          List song = playlists[index][2][0];
          String songName = '';
          for (var i = 0; i < 16; i++) {
            songName += playlists[index][2][0][0][i];
          }
          songName += '...';
          return Container(
            child: SizedBox(
              width: 140,
              child: Card(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      dense: true,
                      title: Text(
                        playlists[index][0],
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Magnificent',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Text('  '),
                        Icon(
                          Icons.music_note,
                          size: 12,
                          color: Colors.blueAccent,
                        ),
                        Text(
                          ' ' + songName,
                          style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'Serif',
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 15),
                        child: IconButton(
                          icon: Icon(
                            Icons.playlist_play,
                            size: 35,
                            color: Colors.orangeAccent,
                          ),
                          onPressed: () {
                            debugPrint('Cannot Play this playlist!');
                            currSong.clear();
                            currSong = song.toList();
                            playlist = playlists[index];
                            navigateToNowPlaying(context);
                          },
                        ))
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget topRelease() {

    List<String> playlistNames = List<String>();
      for (var i = 0; i < playlists.length; i++) {
        playlistNames.add(playlists[i][0]);
    }

    return Container(
      color: Color.fromRGBO(190, 190, 190, 0.5),
      height: 300.0,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: songs.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                width: 160.0,
                child: SizedBox(
                  child: ListTile(
                    leading: Icon(
                      Icons.album,
                      size: 40,
                      color: Colors.amber,
                    ),
                    title: Text(
                      songs[index][0],
                      style: TextStyle(
                          color: Colors.redAccent,
                          fontFamily: 'Gothic',
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w800),
                    ),
                    subtitle: Row(
                      children: <Widget>[
                        Text(
                          'Album: ' + songs[index][2].toString(),
                          style: TextStyle(fontSize: 12.5),
                        ),
                        Text(
                          '      Duraton: ' +
                              songs[index][1].toString() +
                              ' mins',
                          style: TextStyle(
                            fontSize: 12.5,
                          ),
                        ),
                      ],
                    ),
                    // PopUpMenu...
                    trailing: new PopupMenuButton<String>(
                      child: Icon(Icons.playlist_add),
                      itemBuilder: (BuildContext context) {
                        return playlistNames.map((String playlist) {
                          return new PopupMenuItem<String>(
                            child: Text(playlist),
                            value: playlist,
                          );
                        }).toList();
                      },
                    ),
                    onLongPress: () {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Not Interested?'),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Text(
                                        'You don\'t want to see this song on your home screen?'),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text('Remove'),
                                  onPressed: () {
                                    debugPrint('Cancelled Operation!');
                                    Navigator.of(context).pop();
                                  },
                                ),
                                FlatButton(
                                  child: Text('Cancel'),
                                  onPressed: () {
                                    debugPrint('Cancelled Operation!');
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          });

                      debugPrint('Pressed too long');
                    },
                    onTap: () {
                      debugPrint('Canot play this song!');
                      currSong.clear();
                      currSong = songs[index].toList();
                      playlist = PlaylistClass('Random', playlists.length, createSongs()).fromPlaylisttoList();
                      setState(() {
                        playerState = PlayerState.PLAYING;
                      });
                      navigateToNowPlaying(context);
                    },
                  ),
                ));
          }),
    );
  }


// Navigators------------------------------------------------------------------------------------------------------------------
  /// Navigation to [Now Playing] ...
  void navigateToNowPlaying(BuildContext context) {

    Map<String, dynamic> args = {
      'tabController': tabController,
      'songName': currSong[0],
      'albumName': currSong[3].toString(),
      'artistName': currSong[2].toString(),
      'artistImage': currSong[2].toString(),
      'songLength': currSong[1],
      'playlists': playlists,
      'playlist': playlist,
      'currSong': currSong,
      'playerState': playerState,
    };

    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => NowPlayingWidget(args: args,)
    ));
  }

}
