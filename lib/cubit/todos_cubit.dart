import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/data/models/todos.dart';

import '../data/repositories/repository.dart';

part 'todos_state.dart';

class TodosCubit extends Cubit<TodosState> {
  final TodoRepository todoRepository;

  TodosCubit({required this.todoRepository}) : super(TodosInitialState());

  Future<void> fetchTodos() async {
    emit(TodosInitialState());
    try {
      todoRepository.fetchTodos().then((todos) {
        emit(TodosLoadedState(todos));
      });
    } catch (e) {
      emit(TodosErrorState(e.toString()));
    }
  }

  void changeCompletion(Todos todo) {
    todoRepository.changeCompletion(!todo.completed!, todo.id).then((item) {
      todo.completed = item.completed;
      updateTodoList();
    });
  }

  updateTodoList() {
    final currentState = state;
    if (currentState is TodosLoadedState) {
      emit(TodosLoadedState(currentState.todos));
    }
  }

  void addTodo(Todos todo) {
    final currentState = state;
    if (currentState is TodosLoadedState) {
      final currentTodoList = currentState.todos;
      currentTodoList.add(todo);
      emit(TodosLoadedState(currentTodoList));
    }
  }

  void deleteTodo(Todos todo) {
    final currentState = state;
    if (currentState is TodosLoadedState) {
      final currentTodoList = currentState.todos;
      currentTodoList.remove(todo);
      emit(TodosLoadedState(currentTodoList));
    }
  }
}
