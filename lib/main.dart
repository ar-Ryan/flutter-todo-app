import 'package:flutter/material.dart';
import 'package:todo_app/screens/home_screen.dart'; // Import your screen file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your App Title',
      home: HomeScreen(), // Use the imported HomeScreen widget
    );
  }
}
