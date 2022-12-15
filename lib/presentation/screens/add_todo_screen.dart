import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/add_todo_cubit.dart';

class AddTodoScreen extends StatelessWidget {
  AddTodoScreen({Key? key}) : super(key: key);

  final _controller = TextEditingController();
  final _textKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add todo'),
      ),
      body: BlocListener<AddTodoCubit, AddTodoState>(
        listener: (context, state) {
          if (state is AddedTodoState) {
            Navigator.pop(context);
          } else if (state is AddTodoErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
                duration: const Duration(milliseconds: 1000),
              ),
            );
          }
        },
        child: Container(
          margin: const EdgeInsets.all(20.0),
          child: _body(context),
        ),
      ),
    );
  }

  _body(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          key: _textKey,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          autofocus: true,
          controller: _controller,
          decoration: const InputDecoration(hintText: "Enter todo message..."),
        ),
        const SizedBox(height: 10.0),
        InkWell(
          onTap: () {
            final message = _controller.text;
            if(_textKey.currentState!.validate()){
              BlocProvider.of<AddTodoCubit>(context).addTodo(message);
            }
          },
          child: BlocBuilder<AddTodoCubit, AddTodoState>(
            builder: (context, state) {
              if (state is AddingTodoState) {
                return const CircularProgressIndicator();
              }
              return _addBtn(context);
            },
          ),
        )
      ],
    );
  }

  Widget _addBtn(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: const Center(
        child: Text(
          "Add Todo",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
