import 'package:death_delay/settings.dart';
import 'package:death_delay/widget/tab_two.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nfc_reader/flutter_nfc_reader.dart';

import 'widget/my_floating_button.dart';
import 'widget/tab_one.dart';

class Home extends StatefulWidget {

  @override
  HomeState createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  String _text = 'Scan off';
  FlutterNfcReader reader;

  void _handleTap(){
    setState(() {
        _text = 'Scan on';
    });

  }

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
              TabOne(text: _text),
              TabTwo()
            ],
          ),

          floatingActionButton: MyFloatingButton(onChanged: _handleTap)
      ),
    );
  }
}
