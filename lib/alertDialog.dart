import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dialog Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // INITIAL VAR --.> String
  String _inputText = '';

  // void show input dialog

  // AlertDialog
  void _showInputDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          // manage the text input field // controller.text
          TextEditingController controller = TextEditingController();

          return AlertDialog(
            title: const Text('Enter some Text:'),
            content: TextField(
              controller: controller,
              decoration: const InputDecoration(hintText: 'Enter some text'),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel')),
              TextButton(
                  onPressed: () {
                    setState(() {
                      _inputText = controller.text;
                    });
                    Navigator.of(context).pop();
                  },
                  child: const Text('Save'))
            ],
          );
        });
  }

  // appBar - body (updated State text) -- Icon
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My New App!'),
        backgroundColor: Colors.blue,
        titleTextStyle: TextStyle(color: Colors.orange[50]),
      ),
      body: Center(
        child: Text(_inputText.isEmpty ? 'Tap icon to enter text' : _inputText),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showInputDialog,
        child: const Icon(Icons.edit),
      ),
    );
  }
}
