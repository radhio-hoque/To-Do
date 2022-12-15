import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/constants/string.dart';
import 'package:to_do/cubit/todos_cubit.dart';
import 'package:to_do/data/models/todos.dart';

class TodosScreen extends StatelessWidget {
  const TodosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TodosCubit>(context).fetchTodos();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
        actions: [
          InkWell(
            onTap: () => Navigator.pushNamed(context, ADD_TODO_ROUTE),
            child: const Padding(
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
            final todos = state.todos.reversed;
            if(todos.isNotEmpty){
              return SingleChildScrollView(
                child: Column(
                  children: todos.map((todo) => _todo(todo, context)).toList(),
                ),
              );
            } else{
              return const Center(
                child: Text('Noo todo found!'),
              );
            }
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

  Widget _todo(Todos todo, context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, EDIT_TODO_ROUTE, arguments: todo),
      child: Dismissible(
        key: Key("${todo.id}"),
        confirmDismiss: (_) async {
          BlocProvider.of<TodosCubit>(context).changeCompletion(todo);
          return false;
        },
        background: Container(color: Colors.indigo,),
        child: _todoTile(todo, context),
      ),
    );
  }

  Widget _todoTile(Todos todo, context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade200,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(todo.todo!),
          _completionIndicator(todo),
        ],
      ),
    );
  }

  Widget _completionIndicator(Todos todo) {
    return Container(
      width: 20.0,
      height: 20.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        border: Border.all(
          width: 4.0,
          color: todo.completed! ? Colors.green : Colors.red,
        ),
      ),
    );
  }
}
