import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
    theme: themeData,
  ));
}

final ThemeData themeData = new ThemeData(
  canvasColor: Colors.lightBlueAccent,
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Multi Page Demo"),
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 1.0,
      ),
      body: new Center(
        child: new FlatButton(
          onPressed: () {
            Navigator.push(context, new PageTwo());
          },
          child: new Text("Page Two"),
        ),
      ),
    );
  }
}

class PageTwo extends MaterialPageRoute<Null> {
  PageTwo() : super(builder: (BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Page Two"),
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 1.0,
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: () {
            Navigator.push(context, new PageThree());
          },
          child: new Text("Page Three"),
        ),
      ),
    );
  });
}

class PageThree extends MaterialPageRoute<Null> {
  PageThree() : super(builder: (BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Last Page!"),
        backgroundColor: Theme.of(context).accentColor,
        elevation: 2.0,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: new Center(
        child: new MaterialButton(
          onPressed: () {
            Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
          },
          child: new Text("Go Home!"),
        ),
      ),
    );
  });
}
