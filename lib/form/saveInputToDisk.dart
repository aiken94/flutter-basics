import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';

void main() {
  runApp(MaterialApp(
    title: 'Demo',
    home: FlutterDemo(storage: UserInputStorage()),
  ));
}

class UserInputStorage {
  // PATH
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  // FILE
  Future<File> get _localFile async {
    final path = await _localPath;

    return File('$path/input.txt');
  }

  // READ FROM FILE
  Future<String> readUserInput() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();
      return contents;
    } catch (error) {
      return '';
    }
  }

  // WRITE TO FILE
  Future<File> writeUserInput(String userInput) async {
    final file = await _localFile;

    return file.writeAsString(userInput);
  }
}

// Statefulwidget
class FlutterDemo extends StatefulWidget {
  const FlutterDemo({Key? key, required this.storage}) : super(key: key);

  final UserInputStorage storage;

  @override
  State<FlutterDemo> createState() => _FlutterDemoState();
}

// State
class _FlutterDemoState extends State<FlutterDemo> {
  // INIT VAR
  final userInputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.storage.readUserInput().then((value) {
      setState(() {
        userInputController.text = value;
      });
    });
  }

  Future<File> _saveUserInput() {
    return widget.storage.writeUserInput(userInputController.text);
  }

  // scaffold
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userInputController.text.isEmpty
            ? 'DEMO'
            : userInputController.text),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: userInputController,
            decoration: const InputDecoration(labelText: 'Enter Text'),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _saveUserInput();
          });
        },
        tooltip: 'Save',
        child: const Icon(Icons.save),
      ),
    );
  }
}
