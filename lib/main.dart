import 'package:death_delay/class/save_things.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'welcome_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: SaveThings().loadLoggedIn(),
        builder: (context, snapshot){
          if(snapshot.data == null){
            return Center(child: CircularProgressIndicator(),);
          }else {
            return snapshot.data ? Home() : WelcomePage();
          }
        }
      )
    );
  }
}