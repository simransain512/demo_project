import 'package:demo_appentus/Authentication_Screen/Register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
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