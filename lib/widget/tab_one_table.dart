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
          showSecondInfo(context),
        ],
      ),

      /*child: Table(
        children: getRows(),
      ),*/
    );
  }
}

Widget showMainInfo(context) {
  Map<String, dynamic> map = JsonConverter.getJsonMap(JsonConverter.text);
  return getMainInfo(context, map["i"], map["n"], map["a"]);
}

Widget showSecondInfo(context) {
  Map<String, dynamic> map = JsonConverter.getJsonMap(JsonConverter.text);
  return getSecondInfo(context, map);
}

Widget getSecondInfo(context, map) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;

  return Column(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(top: 17, left: (width - (width - 60)) / 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "Other Information",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontFamily: apptheme.fontName,
                  fontSize: 20,
                  color: apptheme.darkerText),
            )
          ],
        ),
      ),
      //Other Informations
      SingleChildScrollView(
          //do bisch gwedn ban padding left du knedlwurst
          padding: EdgeInsets.only(left: 10),
          scrollDirection: Axis.horizontal,
          child: Row(children: <Widget>[
            getOtherInfoItem(
                map['s'], 'Medikamente', apptheme.mediStart, apptheme.mediEnd, apptheme.imagePathMedi),
            getOtherInfoItem(
                map['m'], 'Allergien', apptheme.alliStart, apptheme.alliEnd, apptheme.imagePathAlli),
            getOtherInfoItem(map['l'], 'chronische Krankheiten',
                apptheme.chroniStart, apptheme.chroniEnd, apptheme.imagePathChroni)
          ]))
    ],
  );
}

Widget getOtherInfoItem(
    List<dynamic> list, String title, colorStart, colorEnd, imagePath) {
  return Stack(
    children: <Widget>[
      Padding(
          padding: EdgeInsets.only(top: 32, left: 8, right: 8, bottom: 16),
          child: Container(
            height: 250,
            width: 140,
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: colorEnd.withOpacity(0.6),
                    offset: const Offset(1.1, 4.0),
                    blurRadius: 8.0),
              ],
              gradient: LinearGradient(
                colors: <Color>[
                  colorStart,
                  colorEnd,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0),
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(54.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 54, left: 16, right: 16, bottom: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: apptheme.fontName,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: 0.2,
                      color: apptheme.white,
                    ),
                  ),
                  //MedikamentenListe
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.all(0),
                      children: list.reversed.map((data) {
                        return Text(
                          data,
                          textAlign: TextAlign.left,
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          )
      ),
      Positioned(
        top: 0,
        left: 0,
        child: Container(
          width: 84,
          height: 84,
          decoration: BoxDecoration(
            color: apptheme.nearlyWhite.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
        ),
      ),
      Positioned(
        top: 8  ,
        left: 8,
        child: SizedBox(
          width: 60,
          height: 60,
          child: Image.asset(imagePath),
        ),
      )
    ],
  );
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
              height: (height - 370) / 2,
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
                                        color: apptheme.maininfoRed
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
                                padding: EdgeInsets.only(
                                    top: 10, right: 10, bottom: 10, left: 70),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      height: 48,
                                      width: 2,
                                      decoration: BoxDecoration(
                                        color: apptheme.maininfoGreen
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
                                            "Geb. Datum",
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
                                                  getDateString(gebdate),
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
                                padding: EdgeInsets.only(
                                    top: 10, right: 10, bottom: 10, left: 70),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      height: 48,
                                      width: 2,
                                      decoration: BoxDecoration(
                                        color: apptheme.maininfoYellow
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
                                            "Alter",
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
                                                  getAge(getDateDateTime(
                                                          getDateString(
                                                              gebdate)))
                                                      .toString(),
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
                          )
                        ],
                      )))))
    ],
  );
}

String getDateString(String date) {
  return date.substring(0, 2) +
      '.' +
      date.substring(2, 4) +
      '.' +
      date.substring(4, 8);
}

DateTime getDateDateTime(String date) {
  DateFormat dateFormat = DateFormat("dd.MM.yyyy");
  DateTime dateTime = dateFormat.parse(date);
  return dateTime;
}

int getAge(DateTime birthDate) {
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
