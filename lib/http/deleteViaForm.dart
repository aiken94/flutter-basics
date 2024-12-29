import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

// fromJSON --> Dart Object
class Album {
  final int? id;
  final String? title;

  const Album({this.id, this.title});

  // factory keyword?

  // var myAlbum = Album(1, 2, 'This is my album');
  // method --> create an instance of object

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(id: json['id'], title: json['title']);
  }
}

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failure to load album!');
  }
}

Future<Album> deleteAlbum(String id) async {
  final response = await http.delete(
      Uri.parse('https://jsonplaceholder.typicode.com/albums/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8'
      });

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to delete!');
  }
}

// Flutter App --> Text(Widget)
void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Album> futureAlbum;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum(); // initialize with 1
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DELETE DATA',
      theme: ThemeData(primarySwatch: Colors.red),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('DELETE DATA'),
          centerTitle: true,
          backgroundColor: Colors.red,
          titleTextStyle: const TextStyle(color: Colors.white),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(16.0),
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(snapshot.data!.title ?? 'RECORD DELETED'),
                      TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                            hintText: 'Album ID to Delete'),
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              futureAlbum = deleteAlbum(_controller.text);
                            });
                          },
                          child: const Text('Delete Album'))
                    ],
                  );
                }
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
