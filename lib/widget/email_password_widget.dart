import 'package:flutter/material.dart';

import 'entry_field.dart';

class EmailPasswordWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        EntryField(title: "Email"),
        EntryField(title: "Password", isPassword: true),
      ],
    );
  }
}