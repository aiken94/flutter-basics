import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String description;

  const Todo(this.title, this.description);
}

List<Todo> _todos = [
  const Todo('Task One', 'Take out trash'),
  const Todo('Task Two', 'Paint the house')
];

void main() {
  runApp(MaterialApp(
    title: 'app',
    home: TodosScreen(todos: _todos),
  ));
}

class TodosScreen extends StatefulWidget {
  const TodosScreen({Key? key, required this.todos}) : super(key: key);

  final List<Todo> todos;

  @override
  _TodosScreenState createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Tasks')),
      body: ListView.builder(
        itemCount: _todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_todos[index].title),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailScreen(todo: _todos[index])));
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final Todo? newTodo = await showDialog<Todo>(
              context: context,
              builder: (BuildContext context) {
                String? title;
                String? description;

                return AlertDialog(
                  title: const Text('Create New Task'),
                  content: Column(
                    children: <Widget>[
                      TextField(
                        onChanged: (value) => title = value,
                        decoration: const InputDecoration(labelText: 'Title'),
                      ),
                      TextField(
                        onChanged: (value) => description = value,
                        decoration:
                            const InputDecoration(labelText: 'Description'),
                      )
                    ],
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Cancel'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    TextButton(
                      child: const Text('Save'),
                      onPressed: () {
                        if (title != null && description != null) {
                          Navigator.pop(context, Todo(title!, description!));
                        }
                      },
                    )
                  ],
                );
              });

          if (newTodo != null) {
            setState(() {
              _todos.add(newTodo);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.todo}) : super(key: key);

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(todo.description),
      ),
    );
  }
}
