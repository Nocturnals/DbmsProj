import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:songs_app/app screens/now_playing_widgets/widgets.dart';
import 'package:songs_app/app screens/now_playing_widgets/play-controller-icons.dart';

// Variables...
bool shuffleOn = false;

// Currently Playing Part...
Widget currentSongDisplay(Map<String, dynamic> args){

  return Center(
    // heightFactor: 0.8,
    child: Column(
      children: <Widget>[
        CurrentSongDisplayWidget().songDisplayCard(args),
        CurrentSongDisplayWidget().songName(args),

        CurrentSongDisplayWidget().albumArtistName('Album', 'albumName', args),
        CurrentSongDisplayWidget().albumArtistName('Artist', 'artistName', args),

        CurrentSongDisplayWidget().songLengthIndicator(args),
        CurrentSongDisplayWidget().songSlider(),
        
        Padding(
          padding: const EdgeInsets.only(top: 35),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              CurrentSongDisplayWidget().playBarButton(PlayModeIcons().getShuffleIcon(), 'playMode'),

              CurrentSongDisplayWidget().playBarButton(PlayControllerIcons().getPrevIcon(), 'prev'),
              CurrentSongDisplayWidget().playBarButton(PlayControllerIcons().getPlayIcon(), 'play'),
              CurrentSongDisplayWidget().playBarButton(PlayControllerIcons().getNextIcon(), 'next'),
              CurrentSongDisplayWidget().playBarButton(PlayControllerIcons().getAddPlaylistIcon(), 'addPlaylist'),

            ],
          ),
        ),

      ],
    ),
  );

}
