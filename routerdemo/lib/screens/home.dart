import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text("Home Screen"),
              new RaisedButton(
                child: new Text("Second Page"),
                onPressed: () {
                  Navigator.of(context).pushNamed("/second");
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}