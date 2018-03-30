import 'package:flutter/material.dart';
import 'settings.dart';
import 'login.dart';

void main() => runApp(new LoginApp());

class LoginApp extends StatefulWidget {

  LoginAppState createState() => new LoginAppState();

}

class LoginAppState extends State<LoginApp> {

  String _title = "Please Login";
  Widget _screen;
  Login _login;
  Settings _settings;
  bool _authenticated = false;

  LoginAppState() {
    _login = new Login(onSubmit: () {
      onSubmit();
    });
    _settings = new Settings();
    _screen = _login;
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Login Demo",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(_title),
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.exit_to_app),
                onPressed: () {
                  _logout();
                }
            ),
          ],
        ),
        body: _screen,
      ),
    );
  }

  _logout() {
    print("logging out");
    _setAuthenticated(false);
  }

  onSubmit() {
    print("Login with: '$_login.username' And '$_login.password'");
    _setAuthenticated(true);
  }

  _setAuthenticated(bool auth) {
    setState(() {
      if (auth == true) {
        _screen = _settings;
        _title = "Welcome";
        _authenticated = true;
      }
      else {
        _screen = _login;
        _title = "Please Login";
        _authenticated = false;
      }
    }
    );
  }
}
