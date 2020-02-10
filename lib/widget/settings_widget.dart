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
      children: <Widget>[
        Icon(Icons.lightbulb_outline),
        Text('Darktheme'),
        Switch(
          value: darkTheme,
          onChanged: _changeTheme,
        )
      ],
    );
  }

  void _changeTheme(bool value) {
    setState(() {
      darkTheme = value;
    });
  }
}