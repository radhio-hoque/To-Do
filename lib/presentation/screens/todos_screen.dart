import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/constants/string.dart';
import 'package:to_do/cubit/todos_cubit.dart';

class TodosScreen extends StatelessWidget {
  const TodosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TodosCubit>(context).fetchTodos();

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
      body: BlocBuilder<TodosCubit, TodosState>(
        builder: (context, state) {
          if (state is TodosInitialState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is TodosLoadedState) {
            final todos = state.todos;
            return ListView.builder(
              itemBuilder: (context, index) {
                final todo = todos[index];
                return ListTile(
                  title: Text(todo.title),
                  // leading: Image.network(todo.avatar),
                  subtitle: Text(todo.description),
                );
              },
              itemCount: todos.length,
            );
          }
          if (state is TodosErrorState) {
            return Center(
              child: Text(state.error),
            );
          }
          return Container();
        },
      ),
    );
  }
}
