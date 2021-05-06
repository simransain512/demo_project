import 'package:shared_preferences/shared_preferences.dart';

class  Preferences {

  static saveSession(String uname) async {
    SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences.setString('name',uname);
    print("ddadafefg   "+uname);
  }

  static getSession() async {
    SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
    String getS  = _sharedPreferences.getString('name');
    return getS;
  }

  static logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('name');
    await Future.delayed(Duration(seconds: 2));

  }

}
