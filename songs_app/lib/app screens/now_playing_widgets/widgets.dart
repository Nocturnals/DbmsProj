import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


// Currently Playing Part...
class CurrentSongDisplayWidget {

// Widgets...

  // Go Back Button...
  Widget exitFullScreen(TabController tabController, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Center(
          child: RaisedButton(
          elevation: 6.0,
          child: Text('Exit Full Screen', style: TextStyle(color: Colors.white),),
          onPressed: () {
            tabController.index = 1;
            Navigator.pushNamed(context, '/homePage');
          },
          shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
          color: Colors.red[400],
        ),
      )
    );
  }


  // Song Card...
  Widget songDisplayCard(args) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: EdgeInsets.only(top: 50),
      child: Container(
        height: 300,
        width: 300,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(args['artistImage']),
                fit: BoxFit.cover)),
      ),
      elevation: 32,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }


  // Song Name...
  Widget songName(args) {
    return Padding(
      padding: const EdgeInsets.only(top: 42),
      child: Text(
        args['songName'],
        style: TextStyle(fontSize: 32,
        fontWeight: FontWeight.bold),
      ),
    );
  }


  // Album Name...
  Widget albumArtistName(String type, String key, args) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(type + ':  ', style: TextStyle(color: Colors.black54),),
        Text(
          args[key],
          style: TextStyle(color: Colors.indigo),
        ),
      ],
    );
  }


  // Song Length indicator...
  Widget songLengthIndicator(args) {
    return Container(
      height: 4,
      margin: EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text('0.0', style: TextStyle(), textAlign: TextAlign.start,),
          ),
          Expanded(
            child: Text(args['songLength'], style: TextStyle(), textAlign: TextAlign.end,),
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


  // Play bar buttons..
  Widget playBarButton(Icon icon, String name) {
    return Expanded(child: IconButton(
      icon: icon,
      onPressed: () {
        
      },
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

}
