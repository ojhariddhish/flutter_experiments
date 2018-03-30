import 'package:flutter/material.dart';

void main() => runApp(
  new MaterialApp(home: new MyApp(),)
);

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {

  bool _value = false;

  _onChanged(bool value) {
    setState(() {
      _value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Switch Widget Demo"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Text("Switch? "),
                  new Switch(
                    value: _value,
                    onChanged: (bool value) {
                      _onChanged(value);
                    },
                    activeColor: Colors.redAccent,
                  ),
                ],
              ),
              new Divider(
                height: 20.0,
                color: Colors.transparent,
              ),
              new SwitchListTile(
                value: _value,
                onChanged: (bool value) {
                  _onChanged(value);
                },
                activeColor: Colors.blueAccent,
                title: new Text("Wanna see Infinity War? "),
                subtitle: new Text("All the Avengers are in it."),
                secondary: new Icon(Icons.movie),
              ),
            ],
          ),
        ),
      ),
    );
  }
}