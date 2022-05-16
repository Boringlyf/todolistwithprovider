import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolistwithprovider/provider/todo_provider.dart';
import 'package:todolistwithprovider/widgets/new_todo_item.dart';

import '../model/todo.dart';

class EditTodoPage extends StatefulWidget {
  final Todo todo; //element
  const EditTodoPage({required this.todo, Key? key}) : super(key: key);

  @override
  State<EditTodoPage> createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  final _formKey = GlobalKey<FormState>();
  late String title; // should be preloaded as we are edit existing element
  late String description;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    title = widget.todo.title;
    description = widget.todo.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              final provider = Provider.of<TodoProvider>(context);
              provider.removeTodo(widget.todo);
            },
            icon: Icon(Icons.delete),
          ),
        ],
        backgroundColor: Colors.yellow,
        title: Text(
          'Edit Task',
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: NewTodoItemwidget(
          title: title,
          description: description,
          OnchangedTitle: (title) => setState(() {
            this.title = title;
          }),
          OnchangedDescription: (description) => setState(() {
            this.description = description;
          }),
          saved: () {
            print('editted');
            saveTodo();
          },
        ),
      ),
    );
  }

  void saveTodo() {
    final isValid = _formKey.currentState?.validate();

    if (!isValid!) {
      return;
    } else {
      final provider = Provider.of<TodoProvider>(context);
      provider.updateTodo(widget.todo, title, description);

      Navigator.of(context).pop();
    }
  }
}
