import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolistwithprovider/model/todo.dart';
import 'package:todolistwithprovider/provider/todo_provider.dart';
import './todo_widget.dart';

class TodoListWidget extends StatelessWidget {
  const TodoListWidget({key});

  @override
  Widget build(BuildContext context) {
    final checklist = Provider.of<TodoProvider>(context);
    final tasks_todo = checklist.todos;
    return tasks_todo.isEmpty
        ? Center(
            child: Text(
              'No Tasks todo',
              style: TextStyle(fontSize: 32),
            ),
          )
        : ListView.separated(
            separatorBuilder: (context, index) => Container(
                  height: 12,
                ),
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(16),
            itemBuilder: ((context, index) {
              final todo = tasks_todo[index];
              return TodoWidget(todo: todo);
            }),
            itemCount: tasks_todo.length);
  }
}
