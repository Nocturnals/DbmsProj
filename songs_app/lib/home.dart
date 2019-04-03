import 'package:flutter/material.dart';

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

          title: new Text('Online Music Store'),

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
              icon: Icon(Icons.favorite),
              title: Text('Favourites'),
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.play_arrow),
              title: Text('Play Song')
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: Text('Profile')
            )

          ],
        ),

      ),
    );
  }

}
