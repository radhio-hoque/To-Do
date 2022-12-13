import 'package:flutter/material.dart';
import 'package:to_do/presentation/navigation/router.dart';

void main() {
  runApp(TodoApp(
    todoRouter: TodoRouter(),
  ));
}

class TodoApp extends StatelessWidget {
  TodoRouter? todoRouter;

  TodoApp({super.key, this.todoRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: todoRouter?.generateRoute,
    );
  }
}
