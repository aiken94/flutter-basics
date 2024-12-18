import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// STATELESS MyApp
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

// STATEFUL MyHomePage
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// State --
class _MyHomePageState extends State<MyHomePage> {
  // Initial Var
  String _inputText = '';

  //Widget --> setState() --> update VAR --> Widget Stateful Element --> build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Bar at Top'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
          child: TextField(
        decoration: const InputDecoration(hintText: "Enter some text here!"),
        onChanged: (value) {
          setState(() {
            _inputText = value;
          });
        },
      )),
      bottomSheet: Container(
        alignment: Alignment.center,
        height: 50,
        child: Text('You typed: $_inputText'),
      ),
    );
  }
}

// Scalfold -. AppBar Top, Center TextField, BottomSheet

