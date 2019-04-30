import 'package:flutter/material.dart';

import 'package:songs_app/app screens/home/home.dart';

import 'package:songs_app/app screens/now_playing_widgets/play-controller-icons.dart';

import 'package:audioplayers/audioplayers.dart';


enum PlayMode {
  /// Play songs in [REPEAT] mode ...
  REPEAT, 
  /// Play songs in [ONE REPEAT] mode ...
  REPEAT_ONE, 
  /// Play songs in [NO REPEAT] mode ...
  NO_REPEAT
}

// Now Playing Widget
class NowPlayingWidget extends StatefulWidget {

  NowPlayingWidget({this.fullScreenOn: true,this.args,});

  final bool fullScreenOn;
  final Map<String, dynamic> args;

  @override
  State<StatefulWidget> createState() => NowPlayingWidgetState();

}

// Now Playing Widget State
class NowPlayingWidgetState extends State<NowPlayingWidget> {

  PlayMode playMode;

  AudioPlayer audioPlayer;
  Duration position;
  Duration duration;

  get isPlaying => playerState == PlayerState.PLAYING;
  get isPaused => playerState == PlayerState.PAUSED;

  get durationText =>
      duration != null ? duration.toString().split('.').first : '';
  get positionText =>
      position != null ? position.toString().split('.').first : '';

  @override
  initState() {
    super.initState();
    initPlayer();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // Function runs on call of it's parent class...
  void initPlayer() async {
    audioPlayer = new AudioPlayer();
    await audioPlayer.setReleaseMode(ReleaseMode.STOP);
    // if ( widget.fullScreenOn ) {
    //   // play('https://api.soundcloud.com/tracks/258735531/stream?secret_token=s-tj3IS&client_id=LBCcHmRB8XSStWL6wKH2HPACspQlXg2P');
    // }
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


/// Controlling Song...
  /// [PLAY] ...
  Future<void> play(String url) async {
    await audioPlayer.play(url);
    setState(() => playerState = PlayerState.PLAYING);
  }

  /// [PAUSE] ...
  Future<void> pause() async {
  await audioPlayer.pause();
  setState(() => playerState = PlayerState.PAUSED);
  }

  /// [STOP] ...
  Future<void> resume() async {
    await audioPlayer.resume();
    setState(() {
      playerState = PlayerState.PLAYING;
      position = new Duration();
    });
  }

  /// [STOP] ...
  Future<void> stop() async {
    await audioPlayer.stop();
    setState(() {
      playerState = PlayerState.STOPPED;
      position = new Duration();
    });
  }
/// End of functions------------------------------------------------------------------------------
  

  // Building Widget... 
  @override
  Widget build(BuildContext context) {

    // Return Statement...
    return Scaffold(
      body: Container(

        child: ListView(
          children: <Widget>[

            widget.fullScreenOn ? exitFullScreen(context) : SizedBox(height: 0),

            currentSongDisplay(audioPlayer),

            SizedBox(height: 65,),

            widget.fullScreenOn
            ?
            displayPlaylistHeader()
            :
            SizedBox(height: 0,),

            displayPlaylistName(playlist[0], Colors.indigo[100]),
            displayPlaylistSongs(playlists, playlist),
          
          ],

        ),
        decoration: widget.fullScreenOn 
        ?
        null
        :
        BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.pink,
              width: 3.0,
              style: BorderStyle.solid
            )
          )
        ),

      ),
    );
  }
/// End of Return Statement----------------------------------------------------------------------------


// Widgets...
  // Go Back Button...
  Widget exitFullScreen(BuildContext context,) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Center(
          child: RaisedButton(
          elevation: 6.0,
          child: Text('Exit Full Screen', style: TextStyle(color: Colors.white),),
          onPressed: () {
            setState(() {
              tabController.index = 1;
            });
            Navigator.pushNamed(context, '/homePage');
          },
          shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
          color: Colors.red[400],
        ),
      )
    );
  }


  // Song Card...
  Widget songDisplayCard() {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: EdgeInsets.only(top: 50),
      child: Container(
        height: 300,
        width: 300,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: new AssetImage(currSong[3].toString()),
                fit: BoxFit.cover)),
      ),
      elevation: 32,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }


  // Song Name...
  Widget songName() {
    return Padding(
      padding: const EdgeInsets.only(top: 42),
      child: Text(
        currSong[1],
        style: TextStyle(fontSize: 32,
        fontWeight: FontWeight.bold),
      ),
    );
  }


  // Album Name...
  Widget albumArtistName() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Album:  ', style: TextStyle(color: Colors.black54),),
            Text(
              currSong[4],
              style: TextStyle(color: Colors.indigo),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Artist:  ', style: TextStyle(color: Colors.black54),),
            Text(
              currSong[6],
              style: TextStyle(color: Colors.indigo),
            ),
          ],
        )
      ],
    );
  }


  // Song Length indicator...
  Widget songLengthIndicator() {
    return Container(
      height: 4,
      margin: EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text('0.0', style: TextStyle(), textAlign: TextAlign.start,),
          ),
          Expanded(
            child: Text(currSong[2].toString(), style: TextStyle(), textAlign: TextAlign.end,),
          )
        ],
      ),
    );
  }


  // Slider...
  Widget songSlider() {
    return Slider(
      value: 2.0,
      min: 0.0,
      activeColor: Colors.red[500],
      inactiveColor: Colors.red[100],
      max: 4.47,
      onChangeStart: (value) {},
      onChanged: (value) {},
      onChangeEnd: (value) async {},
    );
  }


  /// Play/Pause Song..
  Widget playerStateButton(Icon icon, Future<void> doIt) {
    return Expanded(child: IconButton(
      icon: icon,
      onPressed: () {
        switch (playerState) {
          case PlayerState.PLAYING:
            setPauseState();
            // doIt;
            break;
          case PlayerState.PAUSED:
            setPlayingState();
            // doIt;
            break;
          default:
        }
      },
    ));
  }

  /// Change Song...
  Widget changeSongButton(Icon icon,) {
    return Expanded(child: IconButton(
      icon: icon,
      onPressed: () {},
    ));
  }

  /// Change PlayerState...
  Widget playerModeButton(Icon icon,) {
    return Expanded(child: IconButton(
      icon: icon,
      onPressed: () {},
    ));
  }


  // Display Playlist Header...
  Widget displayPlaylistHeader() {
    
    return Container(
      
      height: 70,
      
      margin: EdgeInsets.only(left: 0,),
      
      child: Center(
        child: Text(

          'playlist'.toUpperCase(),
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'Magnificent',
          ),
          textAlign: TextAlign.center,
          overflow: TextOverflow.fade,
        
        ),
      ),

      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.black))
      ),
    
    );
  
  }


  // Display Playlist Name...
  Widget displayPlaylistName(String playlistName, Color backgroundColor) {

    return Container(
      
      height: 70,
      
      margin: EdgeInsets.only(left: 0,),
      
      child: Container(
        padding: EdgeInsets.only(top: 17, left: 20),
        child: Text(

          playlistName,
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'Magnificent',
          ),
          textAlign: TextAlign.start,
          overflow: TextOverflow.fade,

        ),
      ),

      color: backgroundColor,
    
    );
  }


/// Main Widget...
  /// Currently Playing Part ...
  Widget currentSongDisplay(AudioPlayer audioPlayer) {

    return Center(
      // heightFactor: 0.8,
      child: Column(
        children: <Widget>[
          songDisplayCard(),
          songName(),

          albumArtistName(),

          songLengthIndicator(),
          songSlider(),
          
          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                
                playerModeButton(PlayModeIcons().getShuffleIcon()),

                changeSongButton(PlayControllerIcons().getPrevIcon()),
                
                /// switching between [play] and [pause] ...
                playerState == PlayerState.PAUSED
                ? 
                playerStateButton(PlayControllerIcons().getPlayIcon(), null)
                :
                (
                  playerState== PlayerState.PLAYING
                  ? 
                  playerStateButton(PlayControllerIcons().getPauseIcon(), null)
                  :
                  playerStateButton(PlayControllerIcons().getPlayIcon(), null)
                ),

                changeSongButton(PlayControllerIcons().getNextIcon()),
                changeSongButton(PlayControllerIcons().getAddPlaylistIcon()),

              ],
            ),
          ),

        ],
      ),
    );

  }


  // Displaying Playlists Songs...
  Widget displayPlaylistSongs(List<List> playlists, List playlist) {

    List<String> playlistNames = List<String>();
    for (var i = 0; i < playlists.length; i++) {
      playlistNames.add(playlists[i][0]);
    }

    List songs =playlist[2];

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
                      songs[index][1],
                      style: TextStyle(
                          color: Colors.redAccent,
                          fontFamily: 'Gothic',
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w800),
                    ),
                    subtitle: Row(
                      children: <Widget>[
                        Text(
                          'Album: ' + songs[index][5].toString(),
                          style: TextStyle(fontSize: 12.5),
                        ),
                        Text(
                          '      Duraton: ' + songs[index][2].toString() + ' mins',
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
                        return playlistNames.map((String playlistName) {
                          return new PopupMenuItem<String>(
                            child: Text(playlistName),
                            value: playlistName,
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
                                    Text('You don\'t want to see this song on your home screen?'),
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
                      currSong.clear();
                      currSong = songs[index].toList();
                      playerState = PlayerState.PLAYING;
                      navigateToNowPlaying(context,);
                    },
                  ),
                ));
          }),
    );
  }

// Navigators------------------------------------------------------------------------------------------------------------------
  /// Navigation to [Now Playing] ...
  void navigateToNowPlaying(BuildContext context,) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => NowPlayingWidget(args: widget.args,)));
  }

}
