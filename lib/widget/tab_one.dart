import 'dart:convert';

import 'package:death_delay/theme/apptheme.dart';
import 'package:death_delay/widget/tab_one_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nfc_reader/flutter_nfc_reader.dart';

import '../home.dart';


class TabOne extends StatefulWidget {
  @override
  TabOneState createState() => TabOneState();
}

class TabOneState extends State<TabOne> {
  NfcData _nfcData;
  String _error;

  Future<String> startNFC() async {
    NfcData response;

    setState(() {
      _nfcData = NfcData();
      _nfcData.status = NFCStatus.reading;
    });

    print('NFC: Scan started');

    try {
      response = await FlutterNfcReader.read();
      print('NFC: Scan readed NFC tag');
    } on PlatformException {
      setState(() {
        _error = "Please enable NFC";
      });
      print('NFC: Scan stopped exception');
    }
    setState(() {
      _nfcData = response;
    });
    return data(_nfcData);
  }
  String data(NfcData nd){
    String s = nd.content;
    int i = s.indexOf('{');
    int j = s.lastIndexOf('}')+1;
    if(i == null || i<0){
      return '';
    }else {
      dynamic js = jsonDecode(s.substring(i, j));
      print(js
      );
      patient = s.substring(i, j);
      return patient;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: apptheme.background,
      child: FutureBuilder(
          future: startNFC(),
          builder: (context, snapshot) {
            return getContent(context, snapshot);
          }
      ),
    );
  }

  Widget getContent(BuildContext context, AsyncSnapshot<dynamic> snapshot) {
    if(_error != null) {
      return Center(
        child: Text(_error),
      );
    }else{
      if (patient == null &&
          (!snapshot.hasData || (snapshot.data as String).length <= 0)) {
        return Center(
            child: CircularProgressIndicator());
      } else {
        if (snapshot.error != null) {
          return Center(
            child: Text('Error reading, please enable NFC'),
          );
        } else {
          return Padding(child: TabOneTable(patient),
              padding: EdgeInsets.all(0));
        }
      }
    }
  }
}