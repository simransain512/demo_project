import 'package:demo_appentus/Authentication_Screen/Register.dart';
import 'package:demo_appentus/Home/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController name = new TextEditingController();
  TextEditingController password = new TextEditingController();
  String save_name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 120.0, left: 15.0),
                child: Text(
                  "Hurray...",
                  style: TextStyle(
                      letterSpacing: 4.0, fontSize: 25.0, color: Colors.black),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  "You are just a step away..!!",
                  style: TextStyle(
                      letterSpacing: 1.0, fontSize: 15.0, color: Colors.grey),
                ),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: name,
                decoration: InputDecoration(
                  labelText: "Enter Mobile Number",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: TextField(
                controller: password,
                decoration: InputDecoration(
                  labelText: "Enter Password",
                ),
              ),
            ),
            SizedBox(
              height: 150.0,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: MaterialButton(
                color: Colors.deepOrange,
                height: 40.0,
                minWidth: 250.0,
                onPressed: () async {
                  SharedPreferences _sharedPreferences =
                      await SharedPreferences.getInstance();
                  _sharedPreferences.setString('name', name.text);
                  //   Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => HomePage(),
                    ),
                    (route) => false,
                  );
                },
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 12.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have a account ? "),
                    InkWell(
                      child: Text("Register Now",
                      style: TextStyle(fontSize: 16.0, color: Colors.deepOrange,
                          fontWeight: FontWeight.bold),),
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Register())),
                    ),
                  ],

              ),
            )
          ],
        ),
      ),
    );
  }
}
