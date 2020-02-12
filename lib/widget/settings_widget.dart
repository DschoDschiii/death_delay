import 'package:death_delay/class/save_things.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

bool darkTheme = false;

class SettingsWidget extends StatefulWidget {
  @override
  SettingsWidgetState createState() => SettingsWidgetState();

}

class SettingsWidgetState extends State<SettingsWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          child: Text('Logout'),
          onPressed: _onPressed,
        )
      ],
    );
  }

  void _onPressed(){
    SaveThings().saveLoggedIn(false);
  }

//  void _changeTheme(bool value) {
//    setState(() {
//      darkTheme = value;
//    });
//  }
}