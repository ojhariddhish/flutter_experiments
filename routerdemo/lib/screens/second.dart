import 'package:flutter/material.dart';

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Second Page"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text("Second Screen"),
              new RaisedButton(
                  child: new Text("Third Page"),
                  onPressed: () {
                    Navigator.of(context).pushNamed("/third");
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}