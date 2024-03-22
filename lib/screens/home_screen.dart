import 'package:flutter/material.dart';
import 'package:todo_app/screens/createTodo_screen.dart';
import 'package:todo_app/screens/setting_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> _todos = ['Buy groceries', 'Walk the dog', 'Finish project'];
  String _searchText = '';

  // Function to update search text
  void _onSearchTextChanged(String text) {
    setState(() {
      _searchText = text;
    });
  }

  // Function to remove a todo at a specific index
  void _removeTodo(int index) {
    setState(() {
      _todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
        actions: [
          // More options button (using an icon)
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Text('Settings'),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsScreen())),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Todos',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: _onSearchTextChanged,
            ),
          ),
          // List of todo items
          Expanded(
            child: ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (context, index) {
                // Filter items based on search text
                if (_searchText.isNotEmpty &&
                    !_todos[index]
                        .toLowerCase()
                        .contains(_searchText.toLowerCase())) {
                  return Container(); // Hide items not matching search
                }
                return Dismissible(
                  // Dismissible widget for swipe deletion
                  key: Key(_todos[index]), // Unique key for each item
                  direction:
                      DismissDirection.endToStart, // Delete on swipe left
                  onDismissed: (direction) =>
                      _removeTodo(index), // Call removeTodo on dismiss
                  child: ListTile(
                    title: Text(_todos[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () =>
                          _removeTodo(index), // Delete on button click
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String newTodo = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateTodoList()),
          );
          if (newTodo != null) {
            setState(() {
              _todos.add(newTodo);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
