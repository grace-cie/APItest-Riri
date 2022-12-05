import "dart:async";
import "dart:convert";
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;


void main() {
  runApp(const FirstScreen());
}
// class TypesHelper{
//   static int toInt(num val){
//     try{
//       if(val == null){
//         return 0;
//       }
//       if(val is int){
//         return val;
//       }else{
//         return val.toInt();
//       }
//     }catch(error){
//       print('Error');
//     }
//     return 0;
//   }
// }

// Fetchapi(String id) async {
//   final response = await http.post(
//     // Uri.parse('https://jsonplaceholder.typicode.com/albums/$id')
//     Uri.parse('http://localhost:3000/api/search-user/$id')
//   );

//   if (response.statusCode == 200){
//     print(Api.fromJson(jsonDecode(response.body)));
//     // return Api.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to load api');
//   }
// }

// Future<Api> updateAlbum(String title) async {
//   final response = await http.put(
//     Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       'title': title,
//     }),
//   );

//   if (response.statusCode == 200) {
//     return Api.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to update api.');
//   }
// }

class Api {
  int id;
  String name;
  String course;
  String status;

  Api({
    required this.id, 
    required this.name,
    required this.course,
    required this.status
  });

  factory Api.fromJson(Map<String, dynamic> json) {
    return Api(
      id: json['id'],
      name: json['name'],
      course: json['course'],
      status: json['status'],
    );
  }
}

// Future<List<Api>> fetchApi(int id) async {
//   final response = await http.post(
//     Uri.parse('https://jsonplaceholder.typicode.com/albums/$id')
//     // Uri.parse('http://localhost:3000/api/search-user/$id')
//   );
//   return (json.decode(response.body)['data'] as List)
//     .map((e) =>Api.fromJson(e))
//     .toList();
//   // if (response.statusCode == 200){
//   //   print(Api.fromJson(jsonDecode(response.body)));
//   //   return Api.fromJson(jsonDecode(response.body));
//   // } else {
//   //   throw Exception('Failed to load api');
//   // }
// }



class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final String apiUrl = "https://gorest.co.in/public/v1/users";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('First Screen'),
        ),
        body: Container(
          color: Colors.grey,
          padding: const EdgeInsets.all(8),
          child: FutureBuilder<List<Api>>(
            future: fetchUsers(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Api> users = snapshot.data as List<Api>;
                return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(8),
                        color: Colors.white,
                        child: Column(
                          children: [
                            Text(users[index].name),
                            Text(users[index].course),
                            Text(users[index].status),

                          ],
                        ),
                      );
                    });
              }
              if (snapshot.hasError) {
                print(snapshot.error.toString());
                return Text('error');
              }
              return CircularProgressIndicator();
            },
          ),
        )
      ),
    );
  }

  Future<List<Api>> fetchUsers() async {
    var response = await http.get(Uri.parse(apiUrl));
    return (json.decode(response.body)['data'] as List)
        .map((e) => Api.fromJson(e))
        .toList();
    
  }
}

// class MainView extends StatefulWidget {

// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() {
//     return _MyAppState();
//   }
// }

// class _MyAppState extends State<MyApp> {
//   final TextEditingController _controller = TextEditingController();


//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Search User',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Search User Example'),
//         ),
//         body: Container(
//           alignment: Alignment.center,
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 // Text(snapshot.data!.title),
//                 TextField(
//                   controller: _controller,
//                   decoration: const InputDecoration(
//                     hintText: 'Enter User Id',
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     fetchApi(int.parse(_controller.text));
//                   },
//                   child: const Text('Search'),
//                 ),
//               ],
//             ),
//           ),
          
            
              
        
          
//         ),
//       );
//   }
// }