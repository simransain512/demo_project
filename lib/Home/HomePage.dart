import 'dart:async';
import 'package:demo_appentus/Authentication_Screen/Login.dart';
import 'package:demo_appentus/Home/SecondScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name;

  Future getSession() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    var getdata = sp.getString("name");
    setState(() {
      name = getdata;
    });
    print("hello name is     >>>>>>>>>>>> " + getdata);
  }

  @override
  void initState() {
    getSession();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              //    mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Image.asset("lib/images/man.png"),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Hello, $name",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                RaisedButton(
                  color: Colors.blueAccent,
                    child: Text("Next",style: TextStyle(color: Colors.white),),
                    onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen()));
                }),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Text(
                    "Logout",
                    style: TextStyle(fontSize: 20.0, color: Colors.redAccent),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.logout,
                        color: Colors.blueAccent,
                      ),
                      onPressed: () async {
                        final SharedPreferences sp =
                            await SharedPreferences.getInstance();
                        sp.remove("name");
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      }),
                ])
              ],
            ),
          ),
        ),
    );
  }
}
