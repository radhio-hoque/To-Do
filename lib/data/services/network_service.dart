import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class NetworkService{
  late Dio _dio;
  final _baseurl = 'http://api.nstack.in/v1';

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
          print("${options.method} ${options.path}");
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