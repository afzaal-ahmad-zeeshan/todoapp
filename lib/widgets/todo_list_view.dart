import 'package:flutter/material.dart';
import 'package:todoapp/model/todo.dart';

class TodoListView extends StatelessWidget {
  final List<Todo> todos;

  const TodoListView(this.todos, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: ((context, index) {
        return ListTile(
          title: Text(todos[index].title),
          onTap: () async {
            // Navigate
            Navigator.pushNamed(
              context,
              "/todos",
              arguments: todos[index],
            ).then((result) {
              // show the result.
              String message;
              if (result == true) {
                message = "The tasks were marked as done.";
              } else {
                message = "Pending tasks in ${todos[index].title} collection.";
              }

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  action: SnackBarAction(
                    label: "Okay",
                    onPressed: () {},
                  ),
                ),
              );
            });
          },
        );
      }),
    );
  }
}
