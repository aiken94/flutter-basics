import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('List View'),
          backgroundColor: Colors.blue,
          titleTextStyle: TextStyle(color: Colors.orange[50]),
        ),
        body: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Person 1'),
              subtitle: const Text('emain@one.com'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () => print('ListTile 1 was tapped'),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Person 2'),
              subtitle: const Text('emain@two.com'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () => print('ListTile 2 was tapped'),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Person 3'),
              subtitle: const Text('emain@three.com'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () => print('ListTile 3 was tapped'),
            ),
          ],
        ),
      ),
    );
  }
}
