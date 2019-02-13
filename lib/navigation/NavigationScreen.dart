import 'package:examen_final_flutter/Model/Question.dart';
import 'package:examen_final_flutter/Settings/SettingsScreen.dart';
import 'package:examen_final_flutter/homescreen/HomeScreen.dart';
import 'package:flutter/material.dart';

class NavigationScreen extends StatefulWidget {
  NavigationScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  HomeScreen _homeScreen = HomeScreen();
  SettingsScreen _settingsScreen = SettingsScreen(question);
  int _currentScreenIndex = 0;

  static Question question;

  _getCurrentScreen() {
    switch (_currentScreenIndex) {
      case 0:
        return _homeScreen;
      case 1:
        return _settingsScreen;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
                child: Container(
                  color: Colors.blue,
                )),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                setState(() {
                  _currentScreenIndex = 0;
                });
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Setting'),
              onTap: () {
                setState(() {
                  _currentScreenIndex = 1;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _getCurrentScreen(),
    );
  }
}