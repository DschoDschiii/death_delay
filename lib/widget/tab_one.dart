import 'dart:convert';

import 'package:death_delay/theme/apptheme.dart';
import 'package:death_delay/widget/json_converter.dart';
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

  Future<String> startNFC() async {
    patient = JsonConverter.text;
    return JsonConverter.text;
    /*NfcData response;

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
    return data(_nfcData);*/
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
            if (patient == null && (!snapshot.hasData || (snapshot.data as String).length <= 0)) {
              return Center(
                  child: CircularProgressIndicator());
            } else {
              if (snapshot.error != null) {
                return Center(
                  child: Text('Error reading'),
                );
              } else {
                return Padding(child: TabOneTable(patient),
                    padding: EdgeInsets.all(0));
              }
            }
          }
      ),
    );
  }

}