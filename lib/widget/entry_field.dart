import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class entryField extends StatelessWidget {
  entryField({this.isPassword = false, this.title});

  final String title;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
      String t = 'Enter your $title';
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
                obscureText: isPassword,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    hintText: t,
                    fillColor: Colors.white,
                    filled: true))
          ],
        ),
      );
    }
  }