import 'dart:ui';

import 'package:death_delay/widget/json_converter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TabOneTable extends StatefulWidget {
  final String s;

  TabOneTable(this.s);


  @override
  TabOneTableState createState() => TabOneTableState();
}

class TabOneTableState extends State<TabOneTable> {
  @override
  Widget build(BuildContext context) {
    return Table(
      children: getRows(),
    );
  }

  List<TableRow> getRows() {
    List<TableRow> rows = [];
    JsonConverter.getCells(widget.s).forEach((f) => {
      rows.add(TableRow(
        children: [f],
      ))
    });
    return rows;
  }
}

class MyTableCell extends StatelessWidget {
  final dynamic text;
  final String lable;

  MyTableCell({this.lable = 'Label', this.text = 'Test'});

  @override
  Widget build(BuildContext context) {
    return TableCell(
        child: Container(
      alignment: Alignment.centerLeft,
      height: 100,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          lable + ": " + text.toString(),
          textAlign: TextAlign.left,
          overflow: TextOverflow.fade,
          style: TextStyle(fontSize: 20),
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient:
              LinearGradient(colors: <Color>[Colors.blue, Colors.cyanAccent])),
    ));
  }
}
