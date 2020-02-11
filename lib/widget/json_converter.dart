import 'dart:convert';
import 'dart:core';

import 'tab_one_table.dart';

bool dev = false;

class JsonConverter {
  static String text = '{"i":"aaaaaaaaaa","n":"Lutz Knoll","a":"18062001","s":["Chinidin"],"m":["Penicillin"],"l":["epilepsie","diabetes"]}';
  static Map<String, String> fields = {"i": "ID","n":"Name", "a": "Alter", "s":"Medikamente", "m":"Allergien", "l":"Chronische Krankheiten"};

  static Map<String, dynamic> getJsonMap(String jsonString){
    return json.decode(jsonString);
  }

  static List<MyTableCell> getCells(String jsonString) {
    if(!dev){
      print('Dev:' +jsonString);
    }
    List<MyTableCell> list = [];
    Map<String, dynamic> json = getJsonMap(dev?text:jsonString);
    fields.forEach((s,l) {
      dynamic curr = json[s];
      if(curr != null){
        list.add(MyTableCell(lable: l,text: curr));
      }
    });
    return list;
  }

  static String toJson(){
    Map<String,dynamic> map = {
      'i': "aaaaaaaaaa",
      'n': "Lutz Knoll",
      'a': '18062001',
      'm': ["Ch","Ch2"]
    };
    String s = jsonEncode(map);
    return s;
  }
}