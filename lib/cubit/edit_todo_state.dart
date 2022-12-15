part of 'edit_todo_cubit.dart';

@immutable
abstract class EditTodoState {}

class EditTodoInitialState extends EditTodoState {}

class EditTodoErrorState extends EditTodoState {
  final String error;

  EditTodoErrorState(this.error);
}

class EditingTodoState extends EditTodoState {}

class EditTodoUpdatedState extends EditTodoState {}

class TodoDeletedState extends EditTodoState {}
