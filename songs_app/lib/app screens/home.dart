import 'package:flutter/material.dart';
import './playlists_class.dart';
import 'package:songs_app/models/songs.dart';
import './login.dart';
import './register.dart';
import './profile.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return HomeState();
  }
}

class HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      child: Scaffold(

        // App Bar...
        appBar: new AppBar(

          title: new Text(
            'BLINK',
            style: TextStyle(
              fontFamily: 'Velhos Tempos',
              fontSize: 28
            ),
          ),
          centerTitle: true,

          actions: <Widget>[
            new IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                debugPrint('Not Working!!');
              }
            )
          ],

        ),

        // Drawer...
        drawer: SideDrawer(),

        // Body...
        body: ListView(
          children: <Widget>[

            Column(
              children: <Widget>[

                //Recently Played...
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                  height: 246,
                  child: Column(
                    children: <Widget>[

                      Headers('Recently Played'),
                      RecentlyPlayed(),
                    
                    ],
                  ),
                ),

                // Top Releasess...
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                  height: 400,
                  child: Column(
                    children: <Widget>[

                      Headers('Top ten Recently Released'),
                      TopRelease(),
                    
                    ],
                  )
                ),

                //Playlists...
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
                  height: 246,
                  child: Column(
                    children: <Widget>[

                      Headers('Playlists'),
                      Playlist(),
                      CreatePlaylist(),
                    
                    ],
                  ),
                ),

              ],
            ),

          ],
        ),

        // Bottom Navigation Bar...
        bottomNavigationBar: BottomNavigator(),

      ),

      onWillPop: () {
        _goToLastScreen();
      },

    );
  }

  void _goToLastScreen() {
    Navigator.pop(context, true);
  }

}

// ---------------------------------------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------------------------------------
// Widgets...

// Side Drawer...
class SideDrawer extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new Column(
        children: <Widget>[
        
          new UserAccountsDrawerHeader(
              accountName: new Text("Music player"), accountEmail: null),
          new Column(
            children: <Widget>[
              new ListTile(
                leading: new Icon(Icons.settings,
                color: Theme.of(context).accentColor),
                title: new Text("Settings"),
                onTap: () {
                  debugPrint('No Settings available!!');
                }
              ),
              new ListTile(
                leading: new Icon(Icons.account_circle,
                color: Theme.of(context).accentColor),
                title: new Text("Log In"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                  debugPrint('Navigated to login page');
                }
              ),
              new ListTile(
                leading: new Icon(Icons.account_box,
                color: Theme.of(context).accentColor),
                title: new Text("Register"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
                  debugPrint('Navigated to login page');
                }
              ),
            ],
          )
        ],

      ),
    );
  }

}

int _currentIndex = 1;
// Bottom Navigation Bar...
class BottomNavigator extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new BottomNavigationBar(
      currentIndex: _currentIndex,
      items: [

        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              _currentIndex = 0;
              Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
            },
          ),
          title: Text('Home'),
        ),

        BottomNavigationBarItem(
          icon: FlatButton(
            child: Row(
              children: <Widget>[
                Text('    '),
                Icon(Icons.play_arrow, size: 35,),
                Icon(Icons.pause, size: 35,),
                Text('    '),
              ],
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
              debugPrint('Cannot play this song');
            },
          ),
          title: Text('', style: TextStyle(fontSize: 0),),
        ),

        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              _currentIndex = 2;
              Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
              debugPrint('No Profile');
            },
          ),
          title: Text('Profile')
        )

      ],
    );
  }
}

// Songs List Header...
class Headers extends StatelessWidget {

  Headers(this._header);

  final String _header;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
      child: ListTile(
        leading: Text(
          _header,
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'LUMOS',
            fontWeight: FontWeight.w800
          ),
        ),
      ),
    );
  }
}

// Recently Played Songs...
class RecentlyPlayed extends StatelessWidget {

  final List<List> songs = createPlaylist();

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 140,
      child: ListView.builder(

        scrollDirection: Axis.horizontal,
        itemCount: songs.length,
        itemBuilder: (BuildContext context, int index) {
          String songName = '';
          for (var i = 0; i < 18; i++) {
            songName += songs[index][0][i];
          }
          return Container(
            child: SizedBox(
              width: 140,
              child: Card(
                child: Column(
                  children: <Widget>[

                    Container(
                      margin: EdgeInsets.only(top: 30, right: 20),
                      child: IconButton(
                        icon: Icon(
                          Icons.play_arrow,
                          size: 50,
                          color: Colors.orangeAccent,
                        ),
                        onPressed: () {
                          debugPrint('Cannot Play this playlist!');
                        },
                      )
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Row(
                        children: <Widget>[
                          Text('  '),
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
                              fontWeight: FontWeight.bold
                            ),
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
}

// Playlists...
class Playlist extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    List<List> playlists = List<List>();
    playlists.add(PlaylistClass('playlist01', 01, createPlaylist()).fromPlaylisttoList());
    playlists.add(PlaylistClass('playlist02', 02, createPlaylist()).fromPlaylisttoList());
    playlists.add(PlaylistClass('playlist03', 03, createPlaylist()).fromPlaylisttoList());
    playlists.add(PlaylistClass('playlist03', 03, createPlaylist()).fromPlaylisttoList());

    return Container(
      height: 140,
      child: ListView.builder(

        scrollDirection: Axis.horizontal,
        itemCount: playlists.length,
        itemBuilder: (BuildContext context, int index) {
          String songName = '';
          for (var i = 0; i < 18; i++) {
            songName += playlists[index][2][0][0][i];
          }
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
                          fontWeight: FontWeight.bold
                        ),
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
                        },
                      )
                    )

                  ],
                ),
              ),
            ),
          );
        },
      
      ),
    );
  }
}

// Create Playlist Widget...
class CreatePlaylist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 50,
      width: 100,
      child: Card(
        child: IconButton(
          icon: Icon(Icons.playlist_add),
          onPressed: () {
            debugPrint('Cannot create playlist');
          },
          tooltip: 'Create Playlist',
        ),
      ),
    );
  
  }
}

// Top Release Widget...
class TopRelease extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final List<List> songs = createPlaylist();

    List<String> playlists = List<String>();
    playlists.add(PlaylistClass('playlist01', 01, createPlaylist()).fromPlaylisttoList()[0]);
    playlists.add(PlaylistClass('playlist02', 02, createPlaylist()).fromPlaylisttoList()[0]);
    playlists.add(PlaylistClass('playlist03', 03, createPlaylist()).fromPlaylisttoList()[0]);
    playlists.add(PlaylistClass('playlist03', 03, createPlaylist()).fromPlaylisttoList()[0]);

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
                  color: Colors.indigo,
                ),
                title: Text(
                  songs[index][0],
                  style: TextStyle(
                    color: Color.fromRGBO(0, 158, 108, 1),
                    fontFamily: 'Gothic',
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w800
                  ),
                ),
                subtitle: Row(
                  children: <Widget>[
                    
                    Text(
                      'Album: ' + songs[index][2].toString(),
                      style: TextStyle(
                        fontSize: 12.5
                      ),
                    ),
                    Text(
                      '      Duraton: ' + songs[index][1].toString() + ' mins',
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
                    return playlists.map((String playlist) {
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
                    }
                  );

                  debugPrint('Pressed too long');
                },
                onTap: () {
                  debugPrint('Canot play this song!');
                },

              ),
            )
          );
        }
      ),

    );
  }
}


// External Functions...
List createPlaylist(){
  List<List> playlistSongs = List<List>();
  playlistSongs.add(Song('You Belong With Me', 3.4, 01, 01, 01).fromSongtoList());
  playlistSongs.add(Song('We don\'t talk anymore', 4.4, 01, 01, 01).fromSongtoList());
  playlistSongs.add(Song('You Belong With Me', 5.4, 01, 01, 01).fromSongtoList());
  playlistSongs.add(Song('You Belong With Me', 3.4, 01, 01, 01).fromSongtoList());
  playlistSongs.add(Song('You Belong With Me', 3.4, 01, 01, 01).fromSongtoList());
  return playlistSongs;
}