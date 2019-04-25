import 'package:flutter/material.dart';

import 'package:songs_app/app screens/home/home.dart';
import 'package:songs_app/app screens/titles.dart';

// PopularSongs Widget...
class PopularSongsWidget extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() {
    return PopularSongsWidgetState();
  }

}

// PopularSongs Widget State...
class PopularSongsWidgetState extends State<PopularSongsWidget> {

  @override
  Widget build(BuildContext context) {

    return Container(
      child: ListView(
        scrollDirection: Axis.vertical,
        
        children: <Widget>[

          sortedSongsTitles('Top Releases'),
          TopRelease(),

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

}
