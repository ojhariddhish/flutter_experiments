import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController scrollController = new ScrollController();
  List<String> entries = ["a", "b", "c", "d", "e", "a", "b", "c", "d", "e"];

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 2,
      child: new Scaffold(
        body: new NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              new SliverAppBar(
                  title: new Text("Riddhish Ojha"),
                  pinned: true,
                  expandedHeight: 250.0,
                  floating: true,
                  forceElevated: innerBoxIsScrolled,
                  flexibleSpace: new LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
                      return new Center(
                        child: new Column(
                          children: <Widget>[
                            new Image(
                              image: new AssetImage('assets/riddhish_ojha.png'),
                              fit: BoxFit.fitHeight,
                              height: 100.0,
                              width: 100.0,
                            ),
                            new TextField()
                          ],
                        ),
                      );
                    }
                  ),
                  /*new FlexibleSpaceBar(
                    background: new Image(
                      image: new AssetImage('assets/riddhish_ojha.png'),
                      fit: BoxFit.fitHeight,
                      height: 100.0,
                      width: 100.0,
                    ),

                  ),*/
                  bottom: new TabBar(
                    tabs: <Tab>[
                      new Tab(text: "FIRST"),
                      new Tab(text: "SECOND"),
                    ],
                  )),
            ];
          },
          body: new TabBarView(
            children: <Widget>[
              new ListView.builder(
                itemCount: entries.length,
                
                itemExtent: 60.0,
                itemBuilder: (buildContext, index) {
                  return new Text(entries[index]);
                },
              ),
              new ListView.builder(
                itemCount: entries.length,
                itemExtent: 60.0,
                itemBuilder: (buildContext, index) {
                  return new Text(entries[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}