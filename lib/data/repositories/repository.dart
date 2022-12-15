import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:to_do/data/models/todos.dart';
import 'package:to_do/data/services/network_service.dart';

import '../models/todo.dart';

class TodoRepository {
  final NetworkService networkService;

  TodoRepository(this.networkService);

  Future<List<Todos>> fetchTodos() async {
    Response response;
    try {
      response = await networkService.getRequest('/todos');
      if (response.statusCode == 200) {
        Todo todoRaw = Todo.fromJson(response.data);
        return todoRaw.todos;
      } else {
        throw Exception(response);
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      throw Exception(e.toString());
    }
  }

  Future<Todos> changeCompletion(bool isCompleted, int? id) async {
    final patchObj = {'completed': isCompleted };
    Response response;
    try {
      response = await networkService.patchRequest('/todos/$id', patchObj);
      if (response.statusCode == 200) {
        return Todos.fromJson(response.data);
      } else {
        throw Exception(response);
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      throw Exception(e.toString());
    }
  }

  Future<Todos> createTodo(String title) async {
    Todos todos = Todos(todo: title, completed: false, userId: 10);
    Response response;
    try {
      response = await networkService.postRequest('/todos/add', todos);
      if (response.statusCode == 201 || response.statusCode == 200) {
        return Todos.fromJson(response.data);
      } else {
        throw Exception(response);
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      throw Exception(e.toString());
    }
  }
}
