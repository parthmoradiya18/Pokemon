import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon/Model.dart';

void main() {
  runApp(MaterialApp(home: Api(),debugShowCheckedModeBanner: false,));
}

class Api extends StatefulWidget {
  const Api({Key? key}) : super(key: key);

  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> {
  List l = [];

  get_pokemon() async {
    var url = Uri.parse('https://dummyapi.online/api/pokemon');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    l = jsonDecode(response.body);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_pokemon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Pokemon",
          style: TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(itemCount: l.length,
        itemBuilder: (context, index) {
          Model m=Model.fromJson(l[index]);
          return Card(
            child: ListTile(
              subtitle: Text("${m.type}\n${m.hitpoints}",
                  style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold)),
              title: Text("${m.pokemon}",
                  style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold)),
              trailing: CircleAvatar(
                  backgroundImage: NetworkImage("${m.imageUrl}")),
              leading: Text("${m.id}",style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold)),
            ),
          );
        },
      ),
    );
  }
}
