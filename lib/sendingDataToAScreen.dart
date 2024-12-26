import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String description;

  const Todo(this.title, this.description);
}

List<Todo> todoList = [
  const Todo('Paint House', 'Paint it black'),
  const Todo('Pet the dog', 'Use a comb to brush as well'),
  const Todo('Go to Moon', 'Dont forget to use rockets')
];

void main() => runApp(MaterialApp(
      title: 'App',
      home: TodoScreen(todos: todoList),
    ));

class TodoScreen extends StatelessWidget {
  const TodoScreen({Key? key, required this.todos}) : super(key: key);

  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Todos')),
        body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(todos[index].title),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailScreen(todo: todos[index])));
              },
            );
          },
        ));
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.todo}) : super(key: key);

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(todo.title)),
      body: Center(child: Text(todo.description)),
    );
  }
}
