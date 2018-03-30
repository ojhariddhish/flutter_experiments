import 'package:flutter/material.dart';

void main() => runApp(
  new MaterialApp(
    home: new MyApp(),
  )
);

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Lifecycle Demo"),
      ),
      drawer: null,
      body: new Container(
        padding: new EdgeInsets.all(10.0),
        child: new Center(

        ),
      ),
    );
  }

  @override
  void initState() {
    print("Init State!!!!");
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("Current State = ${state.toString()}");

    switch(state) {
      case AppLifecycleState.inactive:
        print("State: Inactive");
        break;
      case AppLifecycleState.paused:
        print("State: Paused");
        break;
      case AppLifecycleState.resumed:
        print("State: Resumed");
        break;
      case AppLifecycleState.suspending:
        print("State: Suspending");
        break;
    }
  }

  @override
  void didHaveMemoryPressure() {
    print("Memory Pressure");
  }

  @override
  void deactivate() {
    print("Deactivated");
    super.deactivate();
  }

  @override
  void dispose() {
    print("Dispose!!!!");
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }




}