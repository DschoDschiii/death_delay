import 'dart:ui';

import 'package:death_delay/theme/apptheme.dart';
import 'package:death_delay/widget/json_converter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';


class TabOneTable extends StatefulWidget {
  final String s;

  TabOneTable(this.s);

  //SEX
  @override
  TabOneTableState createState() => TabOneTableState();
}

class TabOneTableState extends State<TabOneTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: apptheme.background,
      child: Column(
        children: <Widget>[
          showMainInfo(context),
        ],
      ),

      /*child: Table(
        children: getRows(),
      ),*/
    );
  }
}
  Widget showMainInfo(context){
    Map<String, dynamic> map = JsonConverter.getJsonMap(JsonConverter.text);
    return getMainInfo(context, map["i"], map["n"], map["a"]);
  }

Widget getMainInfo(context, id, name, gebdate) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;

  return Column(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(top: 15, left: (width - (width - 60)) / 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "Main Info",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontFamily: apptheme.fontName,
                  fontSize: 20,
                  color: apptheme.darkerText),
            )
          ],
        ),
      ),
      Padding(
          padding: EdgeInsets.only(top: 12),
          child: SizedBox(
              height: (height - 370)/2,
              width: width - 60,
              child: Container(
                  decoration: BoxDecoration(
                    color: apptheme.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        bottomLeft: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0),
                        topRight: Radius.circular(68.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: apptheme.grey.withOpacity(0.2),
                          offset: Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                  ),
                  //Inhalt
                  child: Padding(
                      padding: EdgeInsets.only(top: 8, left: 5),
                      child: Row(
                        children: <Widget>[
                          //First Row
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              //MainInfoOne
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      height: 48,
                                      width: 2,
                                      decoration: BoxDecoration(
                                        color: apptheme.maininfoBlue
                                            .withOpacity(0.5),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4.0)),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "ID",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: apptheme.fontName,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              letterSpacing: -0.1,
                                              color: apptheme.grey
                                                  .withOpacity(0.5),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 5),
                                            child: Row(
                                              children: <Widget>[
                                                Text(
                                                  id,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily:
                                                        apptheme.fontName,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    color: apptheme.darkerText,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              //MainInfoTwo
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      height: 48,
                                      width: 2,
                                      decoration: BoxDecoration(
                                        color: apptheme.maininfoRed.withOpacity(0.5),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4.0)),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Name",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: apptheme.fontName,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              letterSpacing: -0.1,
                                              color: apptheme.grey
                                                  .withOpacity(0.5),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 5),
                                            child: Row(
                                              children: <Widget>[
                                                Text(
                                                  name,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily:
                                                        apptheme.fontName,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    color: apptheme.darkerText,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          //Second Row
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              //MainInfoOne
                              Padding(
                                padding: EdgeInsets.only(top: 10, right: 10, bottom: 10, left:70),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      height: 48,
                                      width: 2,
                                      decoration: BoxDecoration(
                                        color:
                                        apptheme.maininfoGreen.withOpacity(0.5),
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(4.0)),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Geb. Datum",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: apptheme.fontName,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              letterSpacing: -0.1,
                                              color: apptheme.grey.withOpacity(0.5),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 5),
                                            child: Row(
                                              children: <Widget>[
                                                Text(
                                                  getDateString(gebdate),
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: apptheme.fontName,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    color: apptheme.darkerText,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              //MainInfoTwo
                              Padding(
                                padding: EdgeInsets.only(top: 10, right: 10, bottom: 10, left:70),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      height: 48,
                                      width: 2,
                                      decoration: BoxDecoration(
                                        color:
                                        apptheme.maininfoYellow.withOpacity(0.5),
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(4.0)),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Alter",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: apptheme.fontName,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              letterSpacing: -0.1,
                                              color: apptheme.grey.withOpacity(0.5),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 5),
                                            child: Row(
                                              children: <Widget>[
                                                Text(
                                                  getAge(getDateDateTime(getDateString(gebdate))).toString(),
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: apptheme.fontName,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    color: apptheme.darkerText,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      )))))
    ],
  );
}

String getDateString(String date){
  return date.substring(0,2) + '.' + date.substring(2,4) + '.' + date.substring(4,8);
}

DateTime getDateDateTime(String date){
  DateFormat dateFormat = DateFormat("dd.MM.yyyy");
  DateTime dateTime = dateFormat.parse(date);
  return dateTime;
}

int getAge(DateTime birthDate){
  DateTime currentDate = DateTime.now();
  int age = currentDate.year - birthDate.year;
  int month1 = currentDate.month;
  int month2 = birthDate.month;
  if (month2 > month1) {
    age--;
  } else if (month1 == month2) {
    int day1 = currentDate.day;
    int day2 = birthDate.day;
    if (day2 > day1) {
      age--;
    }
  }
  return age;
}