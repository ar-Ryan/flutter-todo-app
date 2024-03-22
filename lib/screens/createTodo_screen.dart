import 'package:flutter/material.dart';

class CreateTodoList extends StatefulWidget {
  @override
  _CreateTodoListState createState() => _CreateTodoListState();
}

class _CreateTodoListState extends State<CreateTodoList> {
  final _todoController = TextEditingController();

  void _addTodo() {
    String todoText = _todoController.text.trim();
    if (todoText.isNotEmpty) {
      // Pass the new todo text back to the home screen
      Navigator.pop(context, todoText);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _todoController,
              decoration: InputDecoration(
                labelText: 'Enter Todo',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _addTodo,
              child: Text('Add Todo'),
            ),
          ],
        ),
      ),
    );
  }
}
