import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String description;

  const Todo(this.title, this.description);
}

List<Todo> _todos = [
  const Todo('Task One', 'Take out trash'),
  const Todo('Task Two', 'Paint the house')
];

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String appTitle = 'Form Styling Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: appTitle,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          fontFamily: 'Roboto',
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text(appTitle),
            centerTitle: true,
          ),
          body: const MyCustomForm(),
        ));
  }
}

class MyCustomForm extends StatelessWidget {
  const MyCustomForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(
            height: 16,
          ),
          const TextField(
            style: TextStyle(color: Colors.blue, fontSize: 25),
            decoration: InputDecoration(
                hintText: 'TEXT FIELD',
                prefixIcon: Icon(Icons.person, size: 30)),
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            decoration: InputDecoration(
                labelText: 'TEXT FORM FIELD',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            child: const Text('Submit'),
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
          )
        ],
      ),
    );
  }
}
