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

  List<bool> _data = new List<bool>();

  @override
  void initState() {
    setState(() {
      for(int i=0; i<10; i++) {
        _data.add(false);
      }
    });
  }

  _onChanged(bool value, int index) {
    setState(() {
      _data[index] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ListView Demo"),
      ),
      body: new ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return new Card(
            child: new Container(
              padding: new EdgeInsets.all(8.0),
              child: new Column(
                children: <Widget>[
                  new Text("This is item $index"),
                  new CheckboxListTile(
                    value: _data.elementAt(index),
                    onChanged: (bool value) {
                      _onChanged(value, index);
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                    title: new Text("Item $index"),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: _data.length,
      ),
    );
  }
}
