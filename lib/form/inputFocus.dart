import 'package:flutter/material.dart';

const String appTitle = 'Form Field Focus';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: appTitle,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          fontFamily: 'Roboto',
        ),
        home: const MyCustomForm());
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(hintText: 'Auto Focus is true'),
              autofocus: true,
            ),
            TextField(
              decoration:
                  const InputDecoration(hintText: 'FocusNode Connected'),
              focusNode: myFocusNode,
            ),
            const TextField(
              decoration: InputDecoration(hintText: 'INPUT THREE'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myFocusNode.requestFocus();
        },
        tooltip: 'Click me for focus on box two!',
        child: const Icon(Icons.star),
      ),
    );
  }
}
