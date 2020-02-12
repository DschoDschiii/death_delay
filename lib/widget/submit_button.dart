import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home.dart';
import '../class/save_things.dart';

class SubmitButton extends StatelessWidget {
  final formKey;

  SubmitButton({this.formKey});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        // Validate returns true if the form is valid, otherwise false.
        if (formKey.currentState.validate()) {
          // If the form is valid, display a snackbar. In the real world,
          // you'd often call a server or save the information in a database.
          SaveThings().saveLoggedIn(true);
          Scaffold
              .of(context)
              .showSnackBar(SnackBar(content: Text('Processing Data')));
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Home()));
        }
      },
      child: Text('Login'),
    );
    }
}