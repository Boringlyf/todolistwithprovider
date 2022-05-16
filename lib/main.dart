import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolistwithprovider/provider/todo_provider.dart';

import './screens/todo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => TodoProvider()),
      child: MaterialApp(
        home: TodoScreen(),
      ),
    );
  }
}
