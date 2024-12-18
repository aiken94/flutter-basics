import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: Center(child: Counter()),
      ),
    ));

class Counter extends StatefulWidget {
  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  // Button Counter: 4

  // Initial Value _counter var
  int _counter = 0;

  // Increment Function _counter++
  void _increment() {
    setState(() {
      // Update counter
      _counter++;
    });
  }

  // Widget build() Button onPressed: _increment
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(onPressed: _increment, child: Text('Push Me!')),
        Text('You pressed $_counter')
      ],
    );
  }
}
