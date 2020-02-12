import 'package:shared_preferences/shared_preferences.dart';

class SaveThings {
  Future<bool> saveLoggedIn(bool loggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool('loggedIn', loggedIn);
  }

  Future<bool> loadLoggedIn() async {
    SharedPreferences p = await SharedPreferences.getInstance();
    bool b = p.getBool('loggedIn');
    if(b == null) b = false;
    return b;
  }
}