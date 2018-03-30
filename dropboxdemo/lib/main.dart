import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(
  new MaterialApp(
    home: new MyApp(),
    title: "Dropbox Demo",
  )
);

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {

  String _value = null;
  List<String> values = new List<String>();


  @override
  void initState() {
    values.addAll([
      "Iron Man",
      "Captain America",
      "Thor",
      "Hulk",
      "Spider-man",
      "Doctor Strange"
    ]);

    _value = values.elementAt(0);

  }

  _onChange(String value) {
    setState(() {
      _value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Dropdown Button Demo"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text(
                "Select your favorite hero",
                style: new TextStyle(
                  color: Colors.orange,
                  fontStyle: FontStyle.italic,
                  fontSize: 20.0,
                ),
              ),
              new DropdownButton(
                value: _value,
                items: values.map((String value) {
                  return new DropdownMenuItem(
                    value: value,
                      child: new Row(
                        children: <Widget>[
                          new Icon(Icons.home),
                          new Padding(padding: new EdgeInsets.only(right: 10.0)),
                          new Text("$value")
                        ],
                      )
                  );
                }).toList(),
                onChanged: (String value) {
                  _onChange(value);
                },
                hint: new Text("Marvel Heroes"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
