import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

// Website --> Album Json --> Dart Class --> present the info to Flutter

// DART CLASS <-> JSON

// class Album userId, id, title

// fromJSON --> Dart Object
class Album {
  final int userId;
  final int id;
  final String title;

  const Album({required this.id, required this.userId, required this.title});

  // factory keyword?

  // var myAlbum = Album(1, 2, 'This is my album');
  // method --> create an instance of object

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(id: json['id'], userId: json['userId'], title: json['title']);
  }
}

// Function async Future Album (grab from the website)
// Hard coded to always get album 1
Future<Album> fetchAlbum(int albumId) async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/$albumId'));

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failure to load album!');
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

  void _fetchAlbum() {
    int albumId = int.tryParse(_controller.text) ?? 1;

    setState(() {
      futureAlbum = fetchAlbum(albumId);
    });
  }

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum(1); // initialize with 1
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'demo',
      theme: ThemeData(primarySwatch: Colors.red),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GET HTTP EXAMPLE'),
          centerTitle: true,
          backgroundColor: Colors.red,
          titleTextStyle: const TextStyle(color: Colors.white),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              keyboardType:
                  TextInputType.number, // make this field restrictly number
              decoration: const InputDecoration(labelText: 'Album ID Number'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(onPressed: _fetchAlbum, child: const Text('Submit')),
            const SizedBox(height: 16.0),
            FutureBuilder<Album>(
              future: futureAlbum,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data!.title);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                return const CircularProgressIndicator();
              },
            )
          ],
        )),
      ),
    );
  }
}
