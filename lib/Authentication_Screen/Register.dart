import 'package:demo_appentus/Authentication_Screen/Login.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  TextEditingController name = new TextEditingController();
  TextEditingController number = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top:120.0, left: 15.0),
                child: Text("Let's join us by Registering...",
                style: TextStyle(
                  letterSpacing: 4.0,
                  fontSize: 25.0,
                  color: Colors.black
                ),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: name,
                decoration: InputDecoration(
                  labelText: "Enter Name",
                ),
                ),
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: number,
                decoration: InputDecoration(

                  labelText: "Enter Mobile Number",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                  labelText: "Enter Email ID",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: password,
                decoration: InputDecoration(
                  labelText: "Enter Password",
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: MaterialButton(
              color: Colors.deepOrange,
              height: 40.0,
              minWidth: 250.0,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
              },
              child: Text(
                "Register", style: TextStyle(
                color: Colors.white,
                fontSize: 12.0
              ),
              ),
            ),
          ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Text("Already have a account ? "),
                    InkWell(child: Text("Login"),
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Login())),
                    ),
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
