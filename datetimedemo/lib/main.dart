import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(
  new MaterialApp(
    home: new MyApp(),
  )
);

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {

  DateTime _date = new DateTime.now();
  TimeOfDay _time = new TimeOfDay.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: new DateTime(2015),
        lastDate: new DateTime(2020));

    if (picked != null && picked != _date) {
      print("Selected Date: ${_date.toString()}");
      setState(() {
        _date = picked;
      });
    }
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: _time
    );

    if (picked != null && picked != _time) {
      print("Selected Time: ${_time.toString()}");
      setState(() {
        _time = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("DateTime Picker Demo"),
      ),
      drawer: null,
      body: new Container(
        padding: new EdgeInsets.all(10.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text("Selected Date: ${_date.toString()}"),
              new Divider(height: 20.0,),
              new RaisedButton(
                onPressed: () {
                  _selectDate(context);
                },
                child: new Text("Select Date"),
              ),
              new Divider(height: 20.0,),
              new Text("Selected Time: ${_time.toString()}"),
              new Divider(height: 20.0,),
              new RaisedButton(
                onPressed: () {
                  _selectTime(context);
                },
                child: new Text("Select Time"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}