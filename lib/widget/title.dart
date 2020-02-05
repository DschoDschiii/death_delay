import 'package:flutter/material.dart';

class title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return CircleAvatar(
        child: Image(image: AssetImage('assets/images/logo.png')),
        backgroundColor: Colors.white,
        radius: 100,
      );
    }
  }
