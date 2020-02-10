import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home.dart';

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
          Scaffold
              .of(context)
              .showSnackBar(SnackBar(content: Text('Processing Data')));
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Home()));
        }
      },
      child: Text('Login'),
    );
//      return InkWell(
//        onTap: () {
//          Navigator.push(
//              context, MaterialPageRoute(builder: (context) => Home())); //TODO add validation
//        },
//        child: Container(
//          width: MediaQuery.of(context).size.width,
//          padding: EdgeInsets.symmetric(vertical: 13),
//          alignment: Alignment.center,
//          decoration: BoxDecoration(
//              borderRadius: BorderRadius.all(Radius.circular(15)),
//              boxShadow: <BoxShadow>[
//                BoxShadow(
//                    color: Colors.cyan.withAlpha(100),
//                    offset: Offset(2, 4),
//                    blurRadius: 8,
//                    spreadRadius: 2)
//              ],
//              color: Colors.white),
//          child: Text(
//            'Login',
//            style: TextStyle(fontSize: 20, color: Colors.blue),
//          ),
//        ),
//      );
    }
}