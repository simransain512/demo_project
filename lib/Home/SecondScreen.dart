import 'dart:convert';

import 'package:demo_appentus/Home/Recipe.dart';
import 'package:demo_appentus/Models/JsonFile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  var recipe = Recipe(5, 10);
  List<JsonModel> listModel;
  final personNextToMe =
      "That reminds me about the time when i was ten and our neighbor, her name was Mrs. Mable and she said...";

  @override
  void initState() {
    recipe.makemilkshake();
    getData();
  }

  Future<List<JsonModel>> getData() async {
    var response = await http.get(Uri.https("picsum.photos", "/v2/list"));
    var jsondata = json.decode(response.body).cast<Map<String, dynamic>>();
    List<JsonModel> list =
        jsondata.map<JsonModel>((json) => JsonModel.fromJson(json)).toList();
    setState(() {
      listModel = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment:  MainAxisAlignment.center,
              children: [
            Padding(padding: EdgeInsets.only(left:20.0, right:20.0, top: 100.0), child: Row(
              children: [
                Icon(Icons.airline_seat_legroom_reduced),
                Flexible(child: Text(personNextToMe)),
                Icon(Icons.airline_seat_legroom_reduced),
              ],
            ) ,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(recipe.makeShake.toString(), style: TextStyle(fontSize: 20.0),),
            ),

            listModel==null ? Center(child: CircularProgressIndicator(),) :

            Container(
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: listModel.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Wrap(
                      children: <Widget>[
                        Center(
                          child: Text(listModel[index].author, style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                            listModel[index].downloadUrl,
                            fit: BoxFit.cover,
                            height: 150.0,
                            width: double.infinity,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
    ]),
        ));
  }
}
