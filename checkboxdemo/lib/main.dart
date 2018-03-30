import 'package:flutter/material.dart';

void main() => runApp(
    new MaterialApp(home: new MyApp())
);

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {

  bool _isChecked = false;

  _onChanged(bool value) {
    setState(() {
      _isChecked = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Checkbox Demo"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Text("Check it -> "),
                  new Checkbox(
                    value: _isChecked,
                    onChanged: (bool value) {
                      _onChanged(value);
                    },
                  )
                ],
              ),
              new Divider(
                height: 15.0,
                color: Colors.transparent,
              ),
              new CheckboxListTile(
                value: _isChecked,
                onChanged: (bool value) {
                  _onChanged(value);
                },
                title: new Text("Can you check it?"),
                subtitle: new Text("Yes we can"),
                dense: true,
                activeColor: Colors.amberAccent,
                secondary: const Icon(Icons.check_box),
              ),
            ],
          ),
        ),
      ),
    );
  }
}