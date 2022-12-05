// import "dart:async";

import 'res.dart';
import 'package:flutter/material.dart';
// import "package:http/http.dart" as http;

import 'controller/api-controller.dart';
import 'package:get/get.dart';


void main() {
  runApp(const SearchView());
}

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<StatefulWidget> createState() => SearchViewState();
}


class SearchViewState extends State<SearchView>{
  final apihandler = Get.put(Apihandler());
  final TextEditingController _controller = TextEditingController();
  
  @override
  Widget build(BuildContext context) {

    passId(){
      apihandler.res = _controller.text;
    }

    return Scaffold(
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
                    // getData(_controller.text);
                    passId();
                    apihandler.apiResult();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ResultView(),
                      )
                    );
                  },
                  child: const Text('Search'),
                ),
              ],
          ),
        ),
      );

  }
}
