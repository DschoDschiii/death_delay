import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyFloatingButton extends StatelessWidget{
  MyFloatingButton({Key key, @required this.onChanged}) : super(key: key);

  final Function onChanged;

  void _handleTap() {
    onChanged();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: _handleTap,
      child: Icon(Icons.nfc),
    );
  }

}