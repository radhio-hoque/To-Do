part of 'add_todo_cubit.dart';

@immutable
abstract class AddTodoState {}

class AddTodoInitialState extends AddTodoState {}

class AddTodoErrorState extends AddTodoState {
  final String error;

  AddTodoErrorState({required this.error});
}

class AddingTodoState extends AddTodoState {}

class AddedTodoState extends AddTodoState {}
