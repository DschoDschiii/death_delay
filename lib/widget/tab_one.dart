import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabOne extends StatefulWidget {
  TabOne({Key key, this.text}) : super(key: key);

  final String text;

  @override
  TabOneState createState() => TabOneState();
}

class TabOneState extends State<TabOne> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(widget.text),
    );
  }

}