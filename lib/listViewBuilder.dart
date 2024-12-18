import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> items = ['Item1', 'Item2', 'Item3'];

    return MaterialApp(
      title: 'Example',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('List View'),
          backgroundColor: Colors.blue,
          titleTextStyle: TextStyle(color: Colors.orange[50]),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            return ListTile(
                title: Text(item),
                onTap: () {
                  print('You just tapped on $item');
                });
          },
        ),
      ),
    );
  }
}
