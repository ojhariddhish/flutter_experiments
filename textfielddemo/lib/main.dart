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

class MyAppState extends State<MyApp> {
  String _text = "";
  final TextEditingController _controller = new TextEditingController();

  _onChange(String value) {
    print(value);
    setState(() {
      _text = value;
    });
  }

  _onPressed() {
    print("The text is $_text");
  }

  _onPressed2() {
    print("The text is ${_controller.text}");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("TextField Demo"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new TextField(
                controller: _controller,
                onChanged: (String value) {
                  _onChange(value);
                },
                maxLines: 3,
                autocorrect: true,
                decoration: new InputDecoration(
                  icon: new Icon(Icons.print),
                  hintText: "Type something here",
                  labelText: "What is your name?"
                ),
              ),
              new RaisedButton(
                onPressed: () {
                  _onPressed2();
                },
                child: new Text("Push Me"),
              )
            ],
          ),
        ),
      ),
    );
  }
}