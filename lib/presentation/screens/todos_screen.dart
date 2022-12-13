import 'package:flutter/material.dart';
import 'package:to_do/constants/string.dart';

class TodosScreen extends StatelessWidget {
  const TodosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
        actions: [
          InkWell(
            onTap: () => Navigator.pushNamed(context, ADD_TODO_ROUTE),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(Icons.add_circle_outline),
            ),
          ),
        ],
      ),
      body: Center(
        child: Text('Todos Screen'),
      ),
    );
  }
}
