import "dart:async";
import "dart:convert";
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import "package:dio/dio.dart";
import 'package:http/http.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


void getData(String id) async {
  final response = await Dio().post('http://localhost:3000/api/search-user/$id');
  
  // final response = await http.post(
  //   // Uri.parse('https://jsonplaceholder.typicode.com/albums/$id')
  //   Uri.parse('http://localhost:3000/api/search-user/$id')
  // );
  var fres = response.data;
  print(fres);
  
}

@override
Widget build(BuildContext context) {
  final TextEditingController _controller = TextEditingController();
  return MaterialApp(
    title: 'Search User',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Search User'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Text(),
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: 'Enter User Id',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  getData(_controller.text);
                },
                child: const Text('Search'),
              ),
            ],
          ),
        ),
        
          
            
      
        
      ),
    );
}

}