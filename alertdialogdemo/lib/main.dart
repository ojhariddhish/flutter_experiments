import 'package:flutter/material.dart';

void main() => runApp(
  new MaterialApp(
    home: new MyApp(),
  )
);

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => new MyAppState();
}

enum MyDialogAction {
  yes,
  no,
  maybe
}

class MyAppState extends State<MyApp> {
  String _text = "";

  _onChange(String value) {
    setState(() {
      _text = value;
    });
  }

  _dialogResult(MyDialogAction value) {
    print("You selected $value");
    Navigator.pop(context);
  }

  _showAlert(String message) {
    if (message == null || message.isEmpty) return;

    AlertDialog dialog = new AlertDialog(
      content: new Text(message,
        style: new TextStyle(
          fontSize: 30.0,
        ),
        textAlign: TextAlign.center,
      ),
      title: new Text("Flutter Alert Dialog"),
      actions: <Widget>[
        new FlatButton(
            onPressed: () {
              _dialogResult(MyDialogAction.yes);
            },
            child: new Text("Yes"),
        ),
        new FlatButton(
          onPressed: () {
            _dialogResult(MyDialogAction.no);
          },
          child: new Text("No"),
        ),
        new FlatButton(
          onPressed: () {
            _dialogResult(MyDialogAction.maybe);
          },
          child: new Text("Maybe"),
        )
      ],
    );

    showDialog(context: context, child: dialog);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Alert Dialog Demo"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(10.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new TextField(
                style: new TextStyle(
                  fontSize: 20.0,
                  fontStyle: FontStyle.italic,
                  color: Colors.black
                ),
                onChanged: (String value) {
                  _onChange(value);
                },
              ),
              new RaisedButton(
                onPressed: () {
                  _showAlert(_text);
                },
                child: new Text("Show Alert"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
