import 'package:flutter/material.dart';
import 'strings.dart';
import 'ghflutter.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: Strings.appTitle,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new GHFlutter(),
    );
  }
}




