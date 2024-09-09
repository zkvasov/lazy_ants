import 'dart:async';

import 'package:dio/dio.dart';

import 'models/jsonable.dart';

dynamic _getResponseData<T>(
  Map<String, dynamic> responseData,
) {
  return responseData['data'];
}

abstract class BaseApiClient {
  final Dio dio;

  BaseApiClient(this.dio);

  Future<T> get<T>({
    required String path,
    required T Function(Map<String, dynamic>) converter,
    Jsonable? requestData,
  }) async {
    final response = await dio.get(
      path,
      queryParameters: requestData?.toJson(),
    );

    return converter(_getResponseData(response.data));
  }

  Future<List<T>> getList<T>({
    required String path,
    required T Function(Map<String, dynamic>) converter,
    Jsonable? requestData,
  }) async {
    final response = await dio.get(
      path,
      queryParameters: requestData?.toJson(),
    );

    final List valueList = _getResponseData(response.data);

    final value = valueList.map((dynamic item) {
      return converter(item as Map<String, dynamic>);
    }).toList();
    return value;
  }
}
