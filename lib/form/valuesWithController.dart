import 'package:flutter/material.dart';

const String appTitle = 'Form Values';

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
  final firstController = TextEditingController();
  final secondController = TextEditingController();

  // DISPOSE
  @override
  void dispose() {
    firstController.dispose();
    secondController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Name'),
              controller: firstController,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Email'),
              controller: secondController,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Column(
                    children: [
                      Text('Name: ${firstController.text}'),
                      const SizedBox(
                        height: 10,
                      ),
                      Text('Email: ${secondController.text}')
                    ],
                  ),
                );
              });
        },
        tooltip: 'Show me the values!',
        child: const Icon(Icons.text_fields),
      ),
    );
  }
}
