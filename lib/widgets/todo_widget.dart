import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../model/todo.dart';
import '../provider/todo_provider.dart';
import '../screens/edit_todo_page.dart';
import '../utils.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;
  const TodoWidget({required this.todo, key});

  Widget buildTodo(BuildContext context) {
    return GestureDetector(
      onTap: () {
        editTodo(context, todo);
      },
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Row(
          children: [
            Checkbox(
              value: todo.isDone,
              onChanged: (_) {
                final provider =
                    Provider.of<TodoProvider>(context, listen: false);
                final isDone = provider.toggleTodoStatus(todo);

                Utils.showSnackBar(context,
                    isDone ? 'Task Completed' : 'Task marked is incomplete');
              },
              activeColor: Colors.yellow,
              checkColor: Colors.white,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  todo.title,
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (todo.description.isNotEmpty)
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Text(
                      todo.description,
                      style: TextStyle(fontSize: 20, height: 1.5),
                    ),
                  )
              ],
            ))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Slidable(
          actionPane: SlidableDrawerActionPane(),
          key: Key(todo.id),
          actions: [
            IconSlideAction(
              color: Colors.blue,
              caption: 'Edit',
              onTap: (() {
                editTodo(context, todo);
              }),
              icon: Icons.edit,
            )
          ],
          secondaryActions: [
            IconSlideAction(
              icon: Icons.delete,
              color: Colors.red,
              caption: 'Delete',
              onTap: (() => deleteTodo(context, todo)),
            )
          ],
          child: buildTodo(context)),
    );
  }

  void deleteTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodoProvider>(context, listen: false);
    provider.removeTodo(todo);

    Utils.showSnackBar(context, 'task was Deleted');
  }

  void editTodo(BuildContext context, Todo todo) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: ((context) => EditTodoPage(todo: todo)),
      ),
    );
  }
}
