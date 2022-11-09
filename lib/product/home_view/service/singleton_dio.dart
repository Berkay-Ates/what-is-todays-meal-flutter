import 'package:dio/dio.dart';

class SingletonDio {
  static Dio? _dio;
  static Dio get instance => _dio ?? Dio();
}
