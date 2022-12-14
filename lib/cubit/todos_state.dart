part of 'todos_cubit.dart';

@immutable
abstract class TodosState {}

class TodosInitialState extends TodosState {}

class TodosLoadedState extends TodosState {
  final List<Items> todos;

  TodosLoadedState(this.todos);
}

class TodosErrorState extends TodosState {
  final String error;

  TodosErrorState(this.error);
}
