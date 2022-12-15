import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:to_do/cubit/todos_cubit.dart';

import '../data/repositories/repository.dart';

part 'add_todo_state.dart';

class AddTodoCubit extends Cubit<AddTodoState> {
  final TodoRepository todoRepository;
  final TodosCubit todosCubit;

  AddTodoCubit({required this.todoRepository, required this.todosCubit})
      : super(AddTodoInitialState());

  void addTodo(String message) {
    emit(AddingTodoState());
    try {
      todoRepository.createTodo(message).then((todo) {
        todosCubit.addTodo(todo);
        emit(AddedTodoState());
      });
    } catch (e) {
      emit(AddTodoErrorState(error: e.toString()));
    }
  }
}
