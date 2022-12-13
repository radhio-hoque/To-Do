import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do/constants/string.dart';
import 'package:to_do/presentation/screens/add_todo_screen.dart';
import 'package:to_do/presentation/screens/edit_todo_screen.dart';
import 'package:to_do/presentation/screens/todos_screen.dart';

class TodoRouter{
  Route? generateRoute(RouteSettings settings){
    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => TodosScreen());
      case EDIT_TODO_ROUTE:
        return MaterialPageRoute(builder: (_) => EditTodoScreen());
      case ADD_TODO_ROUTE:
        return MaterialPageRoute(builder: (_) => AddTodoScreen());
      default :
        return null;
    }
  }
}