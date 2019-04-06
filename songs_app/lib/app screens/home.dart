import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './favourites.dart';
import 'package:songs_app/services/authentication.dart';

class HomePage extends StatefulWidget {

  final BaseAuth auth = BaseAuth();

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {

  String apptitle = 'appbar';

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      child: Scaffold(
        
        // App Bar...
        appBar: new AppBar(

          title: new Text(apptitle),

          actions: <Widget>[
            new IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                debugPrint('Not Working!!');
              }
            )
          ],

        ),
        // ...................................................

        // Drawer...
        drawer: new Drawer(

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
                      }),
                ],
              )
            ],
          
          ),

        ),
        // ...................................................

        // Bottom Navigation Bar...
        bottomNavigationBar: new BottomNavigationBar(
          items: [

            BottomNavigationBarItem(
              icon: new IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Favourites()));
                },
              ),
              title: Text('Favourites'),
            ),

            BottomNavigationBarItem(
              icon: new IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () {
                  debugPrint('Not yet done!');
                },
              ),
              title: Text('Play Song')
            ),

            BottomNavigationBarItem(
              icon: new IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () {
                  debugPrint('Not yet done!');
                  _getUser();
                },
              ),
              title: Text('Profile')
            )

          ],
        ),

      ),

      onWillPop: () {
        debugPrint('Warning!!!!!!!!!!!!!!!!!!!!!!!!');
      },
    );
  }
  

  void _getUser() async {
    FirebaseUser user = await widget.auth.getCurrentUser();
    setState(() {
      apptitle = user.email;  
    });
  }

}
