import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api extends StatefulWidget {
  @override
  _ApiState createState() => _ApiState();
}

class _ApiState extends State<Api> {

  getData() async {
    var lst = [];
    var response =
        await http.get(Uri.https('jsonplaceholder.typicode.com', 'users'));
    var jsonData = jsonDecode((response).body);
    // print(jsonData);
    for(var i in jsonData) {
      UserMethod user =
          UserMethod(i['name'], i['username'], i['email']);
      lst.add(user);
    }
    return lst;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      // ElevatedButton(onPressed: getData, child: Text("Check")),
      FutureBuilder(
        future: getData(),
        builder: (context,Snapshot) {
          if(Snapshot.data == null){
            return Container(child: Text("Not response"),);
          }
          else return ListView.builder(
            itemCount: Snapshot.data.length,
            itemBuilder: (context,i){
              return

          }
        }
          )
          
      );
  
  }
}

class UserMethod {
  var  name, username, email;
  UserMethod( this.name, this.username, this.email);
}
