import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/cubit/todos_cubit.dart';
import 'package:to_do/data/models/todos.dart';

import '../data/repositories/repository.dart';

part 'edit_todo_state.dart';

class EditTodoCubit extends Cubit<EditTodoState> {
  final TodoRepository todoRepository;
  final TodosCubit todosCubit;

  EditTodoCubit({required this.todoRepository, required this.todosCubit})
      : super(EditTodoInitialState());

  void deleteTodo(Todos todo) {
    todoRepository.deleteTodo(todo.id).then((isDeleted) {
      if (isDeleted!) {
        todosCubit.deleteTodo(todo);
        emit(TodoDeletedState());
      }
    });
  }

  void updateTodo(Todos todo, String text) {
    emit(EditingTodoState());
    if (text.isEmpty) {
      emit(EditTodoErrorState('Todo is Empty'));
      return;
    }
    try {
      todoRepository.updateTodo(text, todo).then((todos) {
        todo.todo = todos.todo;
        todosCubit.updateTodoList();
        emit(EditTodoUpdatedState());
      });
    } catch (e) {
      emit(EditTodoErrorState(e.toString()));
    }
  }
}
