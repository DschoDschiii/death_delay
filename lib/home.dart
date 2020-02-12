import 'package:death_delay/settings.dart';
import 'package:death_delay/theme/apptheme.dart';
import 'package:death_delay/widget/tab_two.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widget/tab_one.dart';

String patient; //TODO find better way to keep patient info

class Home extends StatefulWidget {
  @override
  HomeState createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: apptheme.background,
            elevation: 0.0,
            title: Text('DeathDelay', style: TextStyle(color: apptheme.darkerText),),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.settings, color: apptheme.darkerText,),
                tooltip: 'Settings',
                onPressed: () {
//              nav to settings
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Settings()));
                },
              )
            ],
            bottom: TabBar(
              labelColor: apptheme.darkerText,
              indicatorColor: apptheme.darkerText,
              tabs: <Widget>[
                Tab(text: ('First Aid')),
                Tab(text: ('Second Aid'))
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              TabOne(),
              TabTwo()
            ],
          ),
      ),
    );
  }
}
