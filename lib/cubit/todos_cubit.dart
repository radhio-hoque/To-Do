import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/repositories/repository.dart';

part 'todos_state.dart';

class TodosCubit extends Cubit<TodosState> {

  final TodoRepository todoRepository;
  TodosCubit({required this.todoRepository}) : super(TodosInitial());
}
