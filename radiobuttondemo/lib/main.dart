import 'package:flutter/material.dart';

void main() => runApp(
    new MaterialApp(home: new MyApp())
);

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => new MyAppState();
}

enum Spiderman {
  peterparker,
  miguelohara,
  milesmorales,
  maydayparker,
  pavitrprabhakar
}

class MyAppState extends State<MyApp> {

  int _selected = 0;
  Spiderman _alternateEgo = Spiderman.peterparker;

  _onChanged(int value) {
    setState(() {
      _selected = value;
    });

    print("Current selected value: $value");
  }

  _onChangedSpiderman(Spiderman value) {
    setState(() {
      _alternateEgo = value;
    });
  }

  List<Widget> makeRadioGroup() {
    List<Widget> radioGroup = new List<Widget>();
    radioGroup.add(
      new Text(
        "Select Your Favorite Spider-man",
        style: new TextStyle(
          color: Colors.blueAccent,
          fontSize: 18.0,
          fontStyle: FontStyle.italic,
        ),
      )
    );

    radioGroup.add(
      new Divider(height: 20.0, color: Colors.transparent,)
    );

    radioGroup.add(
      new RadioListTile(
        value: Spiderman.peterparker,
        groupValue: _alternateEgo,
        onChanged: (Spiderman value) {
          _onChangedSpiderman(value);
        },
        activeColor: Colors.redAccent,
        title: new Text(
          "Peter Parker",
          style: new TextStyle(color: Colors.black),
      ),
        secondary: const Icon(Icons.web),
      ),
    );
    radioGroup.add(
      new RadioListTile(
        value: Spiderman.milesmorales,
        groupValue: _alternateEgo,
        onChanged: (Spiderman value) {
          _onChangedSpiderman(value);
        },
        activeColor: Colors.black,
        title: new Text(
          "Miles Morales",
          style: new TextStyle(color: Colors.redAccent),
        ),
        secondary: const Icon(Icons.web),
      ),
    );
    radioGroup.add(
      new RadioListTile(
        value: Spiderman.miguelohara,
        groupValue: _alternateEgo,
        onChanged: (Spiderman value) {
          _onChangedSpiderman(value);
        },
        activeColor: Colors.redAccent,
        title: new Text(
          "Miguel O'Hara",
          style: new TextStyle(color: Colors.black),
        ),
        secondary: const Icon(Icons.web),
      ),
    );
    radioGroup.add(
      new RadioListTile(
        value: Spiderman.maydayparker,
        groupValue: _alternateEgo,
        onChanged: (Spiderman value) {
          _onChangedSpiderman(value);
        },
        activeColor: Colors.black,
        title: new Text(
          "Mayday Parker",
          style: new TextStyle(color: Colors.redAccent),
        ),
        secondary: const Icon(Icons.web),
      ),
    );
    radioGroup.add(
      new RadioListTile(
        value: Spiderman.pavitrprabhakar,
        groupValue: _alternateEgo,
        onChanged: (Spiderman value) {
          _onChangedSpiderman(value);
        },
        activeColor: Colors.redAccent,
        title: new Text(
          "Pavitr Prabhakar",
          style: new TextStyle(color: Colors.black),
        ),
        secondary: const Icon(Icons.web),
      ),
    );

    return radioGroup;
  }

  List<Widget> makeRadios() {
    List<Widget> list = new List<Widget>();
    for (int i = 0; i < 2; i++) {
      list.add(
          new Row(
            children: <Widget>[
              new Text("Radio $i : "),
              new Radio(
                  value: i,
                  groupValue: _selected,
                  onChanged: (int value) {
                    _onChanged(value);
                  }
              ),
            ],
          )
      );
    }

    list.add(new Divider(height: 30.0, color: Colors.grey,));

    for (int i = 0; i < 2; i++) {
      list.add(
        new RadioListTile(
          value: i,
          groupValue: _selected,
          onChanged: (int value) {
            _onChanged(value);
          },
          activeColor: Colors.purple,
          subtitle: new Text("radio $i in group"),
          title: new Text("Radio $i"),
          secondary: const Icon(Icons.radio),

        ),
      );
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Radio Button Demo"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Center(
          child: new Column(
            //children: makeRadios(),
            children: makeRadioGroup(),
          ),
        ),
      ),
    );
  }
}