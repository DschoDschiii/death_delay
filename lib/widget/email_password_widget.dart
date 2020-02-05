import 'package:flutter/material.dart';

import 'entry_field.dart';

class emailPasswordWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        entryField(title: "Email"),
        entryField(title: "Password", isPassword: true),
      ],
    );
  }
}