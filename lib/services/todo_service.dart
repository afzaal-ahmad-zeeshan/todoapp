import 'package:flutter/material.dart';
import 'package:todoapp/model/todo.dart';
import 'package:todoapp/model/task.dart';

class TodoService {
  final List<Todo> _todos = [
    Todo(
      1,
      "Groceries",
      [
        Task(10, "Apples", false),
        Task(11, "Oranges", true),
        Task(12, "Bananas", false),
        Task(13, "Milk", false),
      ],
    ),
    Todo(
      2,
      "Shopping",
      [
        Task(20, "Sweaters", true),
        Task(21, "Shoes", false),
        Task(22, "Pencils", false),
        Task(23, "Hats", false),
        Task(22, "Chocolates", false),
        Task(23, "Watch", false),
      ],
    ),
    Todo(
      3,
      "Routine",
      [
        Task(30, "Check calendar", false),
        Task(32, "Navigate to office", false),
        Task(33, "Grab a coffee", false),
      ],
    ),
  ];

  List<Todo> getTodos() {
    return _todos;
  }

  void addTodo(Todo todo) {
    _todos.add(todo);
  }

  void updateTodo(int id, Todo todo) {
    if (id != todo.id) {
      throw Exception("The ID of the todo does not match.");
    }
    deleteTodo(id);

    // add the todo
    _todos.add(todo);
  }

  void deleteTodo(int id) {
    _todos.removeWhere((todo) => todo.id == id);
  }

  // Tasks
  List<Task>? getTasks(int todoId) {
    try {
      var todo = _todos.firstWhere((todo) => todo.id == todoId);

      return todo.tasks;
    } on Exception catch (exception) {
      debugPrint(exception.toString());
      return null;
    }
  }

  void addTask(int todoId, Task task) {
    try {
      Todo todo = _todos.firstWhere((todo) => todo.id == todoId);
      todo.tasks.add(task);
    } on Exception catch (exception) {
      debugPrint(exception.toString());
    }
  }

  void updateTask(int todoId, Task task) {
    deleteTask(task.id);

    // add the task
    try {
      var todo = _todos.firstWhere((todo) => todo.id == todoId);
      todo.tasks.add(task);
    } on Exception catch (exception) {
      debugPrint(exception.toString());
    }
  }

  void deleteTask(int taskId) {
    for (var todo in _todos) {
      todo.tasks.removeWhere((task) => task.id == taskId);
    }
  }
}
