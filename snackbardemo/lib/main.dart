import 'package:flutter/material.dart';

void main() => runApp(
  new MaterialApp(
    home: new MyApp()
  )
);

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {
  String _text = "";
  final GlobalKey<ScaffoldState> _scaffoldState = new GlobalKey<ScaffoldState>();

  void _onChange(String value) {
    setState(() {
      _text = value;
    });
  }

  void _showSnackBar(String value) {
    if (value==null || value.isEmpty) return;

    _scaffoldState.currentState.showSnackBar(
      new SnackBar(content: new Text(value)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldState,
      appBar: new AppBar(
        title: new Text("Snackbar Demo"),
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Divider(
                height: 20.0,
                color: Colors.transparent,
              ),
              new TextField(
                decoration: new InputDecoration(
                  hintText: "Enter the Matrix",
                  contentPadding: new EdgeInsets.only(left: 10.0),
                ),
                style: new TextStyle(
                  fontSize: 20.0,
                  color: Colors.black87,
                ),
                onChanged: (String value) {
                  _onChange(value);
                },
              ),
              new Divider(
                height: 10.0,
                color: Colors.transparent,
              ),
              new RaisedButton(
                onPressed: () {
                  _showSnackBar(_text);
                },
                child: new Text("Show SnackBar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
