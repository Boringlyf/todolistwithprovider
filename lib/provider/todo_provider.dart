import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:todolistwithprovider/model/todo.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> _todos = [
    Todo(title: 'Go for a Jog', createdTime: DateTime.now()),
    Todo(title: 'Buy food', createdTime: DateTime.now(), description: '''-Eggs
    -Milk
    -Bread
    -Oat Meal'''),
    Todo(
        title: 'Plan a Trip',
        createdTime: DateTime.now(),
        description: '''- book a plane ticket
    -pack luggage'''),
  ];

  List<Todo> get todos {
    return _todos.where((todo) => todo.isDone == false).toList();
  }

  List<Todo> get todosCompleted {
    return _todos.where((todo) => todo.isDone == true).toList();
  }

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  bool toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();
    return todo.isDone;
  }

  void updateTodo(Todo todo, String title, String description) {
    todo.title = title;
    todo.description = description;
    notifyListeners();
  }
}
