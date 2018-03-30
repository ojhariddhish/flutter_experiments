import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

final ThemeData kIOSTheme = new ThemeData(
  primaryColor: Colors.grey[100],
  primarySwatch: Colors.orange,
  primaryColorBrightness: Brightness.light,
);

final ThemeData kDefaultTheme = new ThemeData(
  primarySwatch: Colors.purple,
  accentColor: Colors.orangeAccent[400],
);

var routes = <String, WidgetBuilder> {
  AddPhotoScreen.routeName : (BuildContext context) => new AddPhotoScreen(),
};

void main() => runApp(
  new MaterialApp(
    home: new MyApp(),
    title: "Drawer Demo App",
    theme: defaultTargetPlatform == TargetPlatform.iOS
        ? kIOSTheme
        : kDefaultTheme,
    routes: routes,
  )
);

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Drawer Demo"),
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
      ),
      drawer: _buildDrawer(),
      body: new Container(
        padding: new EdgeInsets.all(10.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text("Drawer App"),
            ],
          ),
        ),
      ),
    );
  }

  Drawer _buildDrawer() {
    var fontFamily = "Roboto";
    var accountEmail = new Text(
        "dnsoftindia@gmail.com",
        style: new TextStyle(
            color: Theme.of(context).accentColor,
            fontSize: 14.0,
            fontFamily: fontFamily
        )
    );
    var accountName = new Text(
        "DN Soft India",
        style: new TextStyle(
            color: Theme.of(context).accentColor,
            fontSize: 18.0,
            fontFamily: fontFamily
        )
    );
    var accountPicture = new CircleAvatar(
        child: new Icon(Icons.person_outline),
        backgroundColor: Theme.of(context).accentColor
    );

    var header = new UserAccountsDrawerHeader(
      accountEmail: accountEmail,
      accountName: accountName,
      currentAccountPicture: accountPicture,
      decoration: new BoxDecoration(
          color: Theme.of(context).cardColor
      ),
    );

    var tileItem1 = new ListTile(
        leading: new Icon(Icons.add_a_photo),
        title: new Text("Add Photo"),
        subtitle: new Text("Add a photo to your album"),
        onTap: _onTap
    );

    var listView = new ListView(children: [header, tileItem1]);

    var drawer = new Drawer(child: listView);

    return drawer;
  }

  void _onTap() {
    Navigator.popAndPushNamed(context, AddPhotoScreen.routeName);

  }
}

class AddPhotoScreen extends StatelessWidget {

  static String routeName = "addphoto";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Add Photo Activity"),
          elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
        ),
        body: new Center(
          child: new Container(child: new Center(child: new Text("Add Photo Screen"))),
        )
    );
  }
}