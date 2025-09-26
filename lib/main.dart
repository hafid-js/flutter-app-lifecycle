import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  Future<Map<String, dynamic>> ambilData() async {
    try {
      var hasilGet = await http.get(Uri.parse('https://reqres.in/api/users/2'), headers: {
          "Content-Type": "application/json",
          "x-api-key": "reqres-free-v1",
        },);

        if(hasilGet.statusCode >= 200 && hasilGet.statusCode < 300){
          var data = (json.decode(hasilGet.body)["data"] as Map<String, dynamic>);
        return data;
        } else {
          throw (hasilGet.statusCode);
        }
    } catch (err) {
      throw (err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Future Builder'),
      ),
      body: FutureBuilder(future: ambilData(), builder: (context, snapshot) {
        if(snapshot.error != null){
          return Center(child: Text("${snapshot.error}", style: TextStyle(fontSize: 25)),);
        }


        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
        } else { return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("${snapshot.data?["first_name"]}", style: TextStyle(fontSize: 25),)
          ],
        );
        }
         
      }),
      floatingActionButton: FloatingActionButton(onPressed: ambilData),
    );
  }
}