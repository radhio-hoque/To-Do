import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:to_do/data/models/todos.dart';

class NetworkService {
  late Dio _dio;
  final _baseurl = 'https://dummyjson.com';

  NetworkService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: _baseurl,
      ),
    );
    _initializeInterceptors();
  }

  Future<Response> getRequest(String path) async {
    late Response response;
    try {
      response = await _dio.get(path);
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
      throw Exception(e.message);
    }
    return response;
  }

  Future<Response> patchRequest(String path, Map<String, bool> patchObj) async{
      late Response response;
      try {
        response = await _dio.put(path, data: patchObj);
      } on DioError catch (e) {
        if (kDebugMode) {
          print(e.message);
        }
        throw Exception(e.message);
      }
      return response;
  }

  Future<Response> postRequest(String path, Todos createTodo) async {
    late Response response;
    try {
      response = await _dio.post(path, data: createTodo.toJson());
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
      throw Exception(e.message);
    }
    return response;
  }

  // Future<Response> putRequest(String path, CreateUser createUser) async {
  //   late Response response;
  //   try {
  //     response = await _dio.put(path, data: createUser.toJson());
  //   } on DioError catch (e) {
  //     if (kDebugMode) {
  //       print(e.message);
  //     }
  //     throw Exception(e.message);
  //   }
  //   return response;
  // }

  _initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (e, handler) {
        if (kDebugMode) {
          print(e.message);
        }
        handler.next(e);
      },
      onRequest: (options, handler) {
        if (kDebugMode) {
          print("${options.method} : $_baseurl${options.path}");
        }
        handler.next(options);
      },
      onResponse: (e, handler) {
        if (kDebugMode) {
          print(e.data);
        }
        handler.next(e);
      },
    ));
  }
}
