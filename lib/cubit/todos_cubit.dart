import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:to_do/data/models/items.dart';

import '../data/repositories/repository.dart';

part 'todos_state.dart';

class TodosCubit extends Cubit<TodosState> {
  final TodoRepository todoRepository;

  TodosCubit({required this.todoRepository}) : super(TodosInitialState());

  Future<void> fetchTodos() async {
    emit(TodosInitialState());
    try {
      List<Items> todos = await todoRepository.fetchTodos();
      emit(TodosLoadedState(todos));
    } catch (e) {
      emit(TodosErrorState(e.toString()));
    }
  }
}
