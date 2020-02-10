import 'package:flutter/cupertino.dart';

class TabTwo extends StatefulWidget {
  @override
  TabTwoState createState() => TabTwoState();
}

class TabTwoState extends State<TabTwo> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset('assets/images/logo.png'),
    );
  }
}