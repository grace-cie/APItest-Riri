import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/api-controller.dart';
// import "package:dio/dio.dart";
import "dart:convert";
import 'package:http/http.dart' as http;

Future<UserDetails> getData() async {
  Apihandler apifind = Get.find<Apihandler>();
  var apires = apifind.displayres;
  final response = await http.post(Uri.parse(apires));
  return UserDetails.fromJson(jsonDecode(response.body));
}

class UserDetails {

  UserDetails({required this.name, required this.course, required this.status});
  final String name;
  final String course;
  final String status;

  factory UserDetails.fromJson(Map<String, dynamic> data){
    final name = data['name'] as String;
    final course = data['course'] as String;
    final status = data['status'] as String;
    return UserDetails(name: name, course: course, status: status);
  }

}

class ResultView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ResultViewState();
}

class ResultViewState extends State<ResultView> {
  late Future<UserDetails> futureUserDetails;
  

  @override
  void initState() {
    super.initState();
    futureUserDetails = getData();
  }

  @override
  Widget build(BuildContext context) {
    
    // print(apires);

    // getData(apires);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 300, 0, 0),
              child: Column(
                children: [
                  FutureBuilder<UserDetails>(
                    future: futureUserDetails,
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                          var name = snapshot.data!.name;
                          var course = snapshot.data!.course;
                          var status = snapshot.data!.status;
                          // List<String> userdata = [name, course, status];
                          // var fname = Text(userdata[0].toString());
                          // var fcourse = Text(userdata[1].toString());
                          // var fstatus = Text(userdata[2].toString());
                          // List<String> formatted = [fname.toString(), fcourse.toString(), fstatus.toString()];
                          // return Text(formatted.toString());
                          return Text('''
                                      Name: $name
                                      Course: $course
                                      Status: $status''');
                        } else if (snapshot.hasError) {
                          // return Text('${snapshot.error}');
                          return const Text('User Not Found');
                        }
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Exit'),
                        );
                        return const CircularProgressIndicator();
                    }),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Exit')
              ),
            )
          ],
        ),
        // child: Column(
        //   children: [
        //     const Padding(
        //       padding: EdgeInsets.all(8),
        //       child: Text(n),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        //       child: Text(apires),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.all(8),
        //       child: ElevatedButton(
        //         onPressed: () {
        //           Navigator.pop(context);
        //         },
        //         child: const Text('Exit')
        //       ),
        //     )
        //   ],
        // ),
      ),
    );
  }
}