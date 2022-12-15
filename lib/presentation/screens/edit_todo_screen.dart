import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/edit_todo_cubit.dart';
import '../../data/models/todos.dart';

class EditTodoScreen extends StatelessWidget {
  final Todos todo;

  EditTodoScreen({Key? key, required this.todo}) : super(key: key);

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _controller.text = todo.todo!;
    return BlocListener<EditTodoCubit, EditTodoState>(
      listener: (context, state) {
        if (state is EditTodoUpdatedState) {
          Navigator.pop(context);
        } else if (state is EditTodoErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              duration: const Duration(milliseconds: 1000),
            ),
          );
        } else if (state is TodoDeletedState) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Edit Todo"),
          actions: [
            InkWell(
              onTap: () {
                BlocProvider.of<EditTodoCubit>(context).deleteTodo(todo);
              },
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(Icons.delete),
              ),
            )
          ],
        ),
        body: _body(context),
      ),
    );
  }

  Widget _body(context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            autocorrect: true,
            decoration:
                const InputDecoration(hintText: "Enter todo message..."),
          ),
          const SizedBox(height: 10.0),
          InkWell(
            onTap: () {
              BlocProvider.of<EditTodoCubit>(context)
                  .updateTodo(todo, _controller.text);
            },
            child: BlocBuilder<EditTodoCubit, EditTodoState>(
              builder: (context, state) {
                if (state is EditingTodoState) {
                  return const CircularProgressIndicator();
                }
                return _updateBtn(context);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _updateBtn(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: const Center(
        child: Text(
          "Update Todo",
          style: TextStyle(fontSize: 15.0, color: Colors.white),
        ),
      ),
    );
  }
}
