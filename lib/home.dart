import 'package:death_delay/settings.dart';
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
            title: Text('DeathDelay'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.settings),
                tooltip: 'Settings',
                onPressed: () {
//              nav to settings
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Settings()));
                },
              )
            ],
            bottom: TabBar(
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
