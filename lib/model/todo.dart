import 'package:flutter/foundation.dart';

class Todo {
  DateTime createdTime;
  String title;
  String id;
  String description;
  bool isDone;

  Todo(
      {required this.title,
      required this.createdTime,
      this.description = '',
      this.id = '',
      this.isDone = false});
}
