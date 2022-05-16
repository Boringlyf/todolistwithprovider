import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/todo_provider.dart';
import './todo_widget.dart';

class CompletedTasksWidget extends StatelessWidget {
  const CompletedTasksWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final checklist = Provider.of<TodoProvider>(context);
    final tasks_todo = checklist.todosCompleted;
    return tasks_todo.isEmpty
        ? Center(
            child: Text(
              'No Completed Tasks',
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
