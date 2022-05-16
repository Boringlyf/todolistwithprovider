import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todolistwithprovider/model/todo.dart';
import 'package:todolistwithprovider/provider/todo_provider.dart';
import '../widgets/completed_task_widget.dart';
import '../widgets/new_todo_item.dart';
import '../widgets/todolist_widget.dart';

class TodoScreen extends StatefulWidget {
  TodoScreen({key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final _formKey = GlobalKey<FormState>();
  int selected_index = 0;

  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) {
    final pages = [TodoListWidget(), CompletedTasksWidget()];
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          FontAwesomeIcons.stream,
          color: Colors.black,
        ),
        centerTitle: true,
        backgroundColor: Colors.yellowAccent,
        title: Text(
          'Todo App',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.yellow[400],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black.withOpacity(0.4),
        currentIndex: selected_index,
        onTap: (value) => setState(() {
          selected_index = value;
        }),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.checklist_outlined), label: 'Todo'),
          BottomNavigationBarItem(icon: Icon(Icons.done), label: 'Finished')
        ],
      ),
      body: pages[selected_index],
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.black,
        onPressed: () => showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text('Add Todo'),
                  content: Form(
                    key: _formKey,
                    child: NewTodoItemwidget(
                      OnchangedTitle: ((title) {
                        setState(() {
                          this.title = title;
                        });
                      }),
                      OnchangedDescription: ((description) =>
                          this.description = description),
                      saved: addTodo,
                    ),
                  ),
                ),
            barrierDismissible: true),
        child: Icon(Icons.add),
      ),
    );
  }

  void addTodo() {
    final isValid = _formKey.currentState?.validate();

    if (!isValid!) {
      return;
    } else {
      final todo = Todo(
        title: title,
        description: description,
        createdTime: DateTime.now(),
        id: DateTime.now().toString(),
      );

      final provider = Provider.of<TodoProvider>(context, listen: false);
      provider.addTodo(todo);

      Navigator.of(context).pop();
    }
  }
}
