import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class AppDio {
  AppDio._singleton();

  static final AppDio instance = AppDio._singleton();
  static Dio? _dio;

  Dio get dio {
    if (_dio != null) {
      return _dio!;
    }

    _dio = _setupDio();
    return _dio!;
  }

  Dio _setupDio() {
    final dioOptions = BaseOptions(contentType: "application/json");

    _dio = Dio(dioOptions);

    _dio?.interceptors.add(PrettyDioLogger(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: false,
      responseBody: true,
      error: true,
      maxWidth: 90,
      enabled: kDebugMode,
    ));

    return _dio!;
  }
}
