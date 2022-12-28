import 'package:todoapp/model/task.dart';

class Todo {
  int id;
  String title;

  List<Task> tasks;

  Todo(
    this.id,
    this.title,
    this.tasks,
  );
}
