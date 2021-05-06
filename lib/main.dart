import 'package:demo_appentus/Authentication_Screen/Register.dart';
import 'package:demo_appentus/Home/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var _name = preferences.getString('name');
  runApp(_name == null ? MyApp() : MainScreen());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Colors.deepOrange,
        backgroundColor: Colors.white,
      ),
      home: Register(),
    );
  }
}