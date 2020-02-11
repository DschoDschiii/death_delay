import 'dart:convert';

import 'package:death_delay/widget/tab_one_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_nfc_reader/flutter_nfc_reader.dart';

String string;

class TabOne extends StatefulWidget {
  TabOne({Key key, this.text}) : super(key: key);

  final String text;

  @override
  TabOneState createState() => TabOneState();
}

class TabOneState extends State<TabOne> {
  NfcData _nfcData;

  Future<String> startNFC() async {
    NfcData response;

    setState(() {
      _nfcData = NfcData();
      _nfcData.status = NFCStatus.reading;
    });

    print('NFC: Scan started');

    try {
      print('NFC: Scan readed NFC tag');
      response = await FlutterNfcReader.read();
    } on PlatformException {
      print('NFC: Scan stopped exception');
    }
    setState(() {
      _nfcData = response;
    });
    return data(_nfcData);
  }

  String data(NfcData nd){
    print('ID:' + nd.id);
    print('Content:' + nd.content);
    print('Error:' + nd.error);
    print('Status:' + nd.status.toString());
    String s = nd.content;
    int i = s.indexOf('{');
    int j = s.lastIndexOf('}')+1;
    if(i == null || i<0){
      return '';
    }else {
      dynamic js = jsonDecode(s.substring(i, j));
      print(js
      );
      return s.substring(i, j);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: startNFC(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || (snapshot.data as String).length <= 0) {
            return Center(
                child: CircularProgressIndicator());
          } else {
            if(snapshot.error!= null) {
              return Center(
                child: Text('Error reading'),
              );
            }else{
              return Padding(child: TabOneTable(snapshot.data), padding: EdgeInsets.all(20));
            }
          }
        }
    );
  }

}