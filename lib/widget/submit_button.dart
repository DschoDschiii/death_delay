import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home.dart';

class submitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Home())); //TODO add validation
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 13),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.cyan.withAlpha(100),
                    offset: Offset(2, 4),
                    blurRadius: 8,
                    spreadRadius: 2)
              ],
              color: Colors.white),
          child: Text(
            'Login',
            style: TextStyle(fontSize: 20, color: Colors.blue),
          ),
        ),
      );
    }
}