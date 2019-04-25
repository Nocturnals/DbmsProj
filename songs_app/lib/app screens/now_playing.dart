import 'package:flutter/material.dart';

import 'package:songs_app/app screens/home/home.dart';
import 'package:songs_app/app screens/now_playing_widgets/current_song_display.dart';
import 'package:songs_app/app screens/playlists.dart';
import 'package:songs_app/app screens/now_playing_widgets/widgets.dart';


/// Communicates the current state of the audio player.
enum PlayerState {
  /// Player is stopped. No file is loaded to the player. Calling [resume] or
  /// [pause] will result in exception.
  STOPPED,
  /// Currently playing a file. The user can [pause], [resume] or [stop] the
  /// playback.
  PLAYING,
  /// Paused. The user can [resume] the playback without providing the URL.
  PAUSED,
  /// The playback has been completed. This state is the same as [STOPPED],
  /// however we differentiate it because some clients might want to know when
  /// the playback is done versus when the user has stopped the playback.
  COMPLETED,
}



// Now Playing Widget
class NowPlayingWidget extends StatefulWidget {
  NowPlayingWidget({
    this.tabController,
    this.fullScreenOn: true,
    this.songName, 
    this.artistName: 'Unknown', 
    this.albumName: 'Unknown', 
    this.artistImage: 'assets/songs/song-bg-1.jpg',
    this.songLength: 0.00,
    this.playlists,
    this.playlist,
    Key key,
  }) : super(key: key);

  final bool fullScreenOn;
  final TabController tabController;
  final String songName;
  final String artistName;
  final String albumName;
  final String artistImage;
  final double songLength;
  final List<List> playlists;
  final List playlist;

  @override
  State<StatefulWidget> createState() => NowPlayingWidgetState();

}

// Now Playing Widget State
class NowPlayingWidgetState extends State<NowPlayingWidget> {

  @override
  initState() {
    super.initState();
    // initPlayer();
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    // final Map<String, dynamic> args = {
    //   'tabController': widget.tabController,
    //   'songName': widget.songName,
    //   'albumName': widget.albumName,
    //   'artistName': widget.artistName,
    //   'artistImage': widget.artistImage,
    //   'songLength': widget.songLength.toString(),
    // };
    final Map<String, dynamic> args = {
      'tabController': widget.tabController,
      'songName': widget.songName,
      'albumName': widget.albumName,
      'artistName': widget.artistName,
      'artistImage': widget.artistImage,
      'songLength': widget.songLength.toString(),
    };


    // Return Statement...
    return Scaffold(
      body: Container(

        child: ListView(
          children: <Widget>[

            widget.fullScreenOn ? CurrentSongDisplayWidget().exitFullScreen(tabController, context) : SizedBox(height: 0),

            currentSongDisplay(args),

            SizedBox(height: 65,),

            widget.fullScreenOn
            ?
            CurrentSongDisplayWidget().displayPlaylistHeader()
            :
            SizedBox(height: 0,),

            CurrentSongDisplayWidget().displayPlaylistName(playlist[0], Colors.indigo[100]),
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

}
