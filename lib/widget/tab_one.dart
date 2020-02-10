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

  Future<NfcData> startNFC() async {
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
    return _nfcData;
  }

  String data(String s){
    print(s);
    int i = s.indexOf('[');
    int j = s.lastIndexOf(']')+1;
    if(i == null || i<0){
      return 'Could not read NFC-Tag';
    }else {
      string = s.substring(i, j);
      return s.substring(i, j);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: startNFC(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
                child: CircularProgressIndicator());
          } else {
            if(snapshot.error!= null) {
              return Center(
                child: Text('Error reading'),
              );
            }else{
              return Center(
                child: Text(
                    data((snapshot.data as NfcData).content)
                ),
              );
            }
          }
        }
    );
  }

}