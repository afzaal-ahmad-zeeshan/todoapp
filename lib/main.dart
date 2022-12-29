import 'package:flutter/material.dart';
import 'package:todoapp/model/todo.dart';
import 'package:todoapp/pages/todo_page.dart';
import 'package:todoapp/services/todo_service.dart';
import 'package:todoapp/widgets/todo_list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Todo App'),
      routes: {
        "/todos": (context) => const TodoPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Todo>? todos;

  @override
  void initState() {
    super.initState();
    todos = TodoService().getTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 2,
        shadowColor: Theme.of(context).shadowColor,
      ),
      body: todos == null
          ? const Center(
              child: Text("Loading..."),
            )
          : TodoListView(todos!),
    );
  }
}
