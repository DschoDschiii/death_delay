import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widget/settings_widget.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.exit_to_app),
//            onPressed: () {
//        //      Nav back to home
//              Navigator.pop(context);
//            },
//          )
//        ],
      ),
      body: Center(
        child: SettingsWidget()
      ),
    );
  }
}