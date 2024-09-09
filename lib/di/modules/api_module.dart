import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../core/api/api_constants.dart';

@module
abstract class ApiModule {
  @lazySingleton
  Dio apiDio() {
    return Dio()
      ..options.sendTimeout = const Duration(seconds: 10)
      ..options.baseUrl = ApiConstants.baseUrl
      ..interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }
}
