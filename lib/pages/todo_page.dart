import 'package:flutter/material.dart';
import 'package:todoapp/model/todo.dart';
import 'package:todoapp/services/todo_service.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<StatefulWidget> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  Todo? todo;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final todoArgument = ModalRoute.of(context)?.settings.arguments as Todo;
    todo = todoArgument;

    return Scaffold(
      appBar: AppBar(
        title: Text(todo?.title ?? "Not found"),
      ),
      body: todo == null
          ? const Center(
              child: Text("Loading..."),
            )
          : ListView.builder(
              itemCount: todo!.tasks.length,
              itemBuilder: ((context, index) {
                var task = todo!.tasks[index];
                return ListTile(
                  leading: Checkbox(
                    value: task.done,
                    onChanged: (value) {
                      task.done = value!;
                      TodoService().updateTask(todo!.id, task);
                      setState(() {});
                    },
                  ),
                  title: Text(task.title),
                );
              }),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: todo == null
            ? null
            : () {
                // mark all the tasks as done.
                for (var task in todo!.tasks) {
                  task.done = true;
                  TodoService().updateTask(todo!.id, task);
                }
                Navigator.pop(context, true);
              },
        tooltip: 'Mark all as done',
        child: const Icon(Icons.done_all),
      ),
    );
  }
}
