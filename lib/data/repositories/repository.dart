import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:to_do/data/services/network_service.dart';
import '../models/todo.dart';

class TodoRepository{

  NetworkService networkService = NetworkService();
  Future<Todo> getListUser() async {
    Response response;
    try {
      response = await networkService.getRequest('');
      if (response.statusCode == 200) {
        return Todo.fromJson(response.data);
      } else {
        if (kDebugMode) {
          print('There is some problem status code not 200');
        }
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