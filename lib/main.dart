import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyHomePage()));

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          color: Colors.blue,
        ),
      );
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          if (isButtonPressed) {
            setState(() {
              isButtonPressed = false;
            });
          } else {
            setState(() {
              isButtonPressed = true;
            });
          }
        },
        child: Container(color: getColor()),
      ),
    );
  }

  Color getColor() {
    if (isButtonPressed) {
      return Colors.red;
    }

    return Colors.blue;
  }
}
