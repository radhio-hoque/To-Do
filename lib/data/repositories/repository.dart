import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:to_do/data/models/items.dart';
import 'package:to_do/data/services/network_service.dart';

import '../models/todo.dart';

class TodoRepository {
  final NetworkService networkService;

  TodoRepository(this.networkService);

  Future<List<Items>> fetchTodos() async {
    Response response;
    try {
      response = await networkService.getRequest('/todos');
      if (response.statusCode == 200) {
        Todo todoRaw = Todo.fromJson(response.data);
        return todoRaw.items;
      } else {
        throw Exception('status code : ${response.statusCode}');
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      throw Exception(e.toString());
    }
  }
}
