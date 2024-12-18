import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyHomePage()));

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Initialize a list of to-do items
  final List<String> _todos = [
    'Buy milk',
    'Walk the dog',
    'Clean the house',
  ];

  // Function to add a new to-do item
  void _addTodo() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newTodo = '';
        // Show a dialog with a text field to add a new to-do item
        return AlertDialog(
          title: Text('Add a new task'),
          content: TextField(
            autofocus: true,
            onChanged: (value) {
              newTodo = value;
            },
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                // Add the new to-do item to the list and close the dialog
                setState(() {
                  _todos.add(newTodo);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
        backgroundColor: Colors.blue,
        titleTextStyle: TextStyle(color: Colors.orange[50]),
      ),
      body: ListView.builder(
        itemCount: _todos.length,
        itemBuilder: (context, index) {
          final todo = _todos[index];

          return ListTile(
            title: Text(
              todo,
              style: TextStyle(
                  decoration: todo.startsWith('-')
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
            onTap: () {
              setState(() {
                if (todo.startsWith('-')) {
                  _todos[index] = todo.substring(2);
                } else {
                  _todos[index] = '- $todo';
                }
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodo,
        child: const Icon(Icons.add),
      ),
    );
  }
}
