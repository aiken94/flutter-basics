import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyWidget()));

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          color: Colors.blue,
        ),
      );
}
