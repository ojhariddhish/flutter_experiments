import 'package:flutter/material.dart';

void main() => runApp(
  new MaterialApp(
    home: new MyApp(),
    title: "Slider Demo",
  )
);

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {

  double _value = 0.0;

  _onChanged(double value) {
    setState(() {
      _value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Slider Demo"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text("Slider value is ${_value.ceilToDouble()}"),
              new PopupMenuDivider(
                height: 20.0,
              ),
              new Slider(
                value: _value,
                onChanged: (double value) {
                  _onChanged(value);
                },
                min: 0.0,
                max: 100.0,
                activeColor: Colors.deepOrangeAccent,
                inactiveColor: Colors.deepPurpleAccent,
              ),
              new Divider(
                height: 20.0,
                color: Colors.transparent,
              ),
              new LinearProgressIndicator(
                value: _value * .01,

              ),
            ],
          ),
        ),
      ),
    );
  }
}
