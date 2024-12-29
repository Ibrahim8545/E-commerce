import 'package:dio/dio.dart';
import 'package:ecommerce_online_c11/core/utils/constants_manager.dart';
import 'package:flutter/material.dart';

class ApiManager {
  late Dio dio;
  ApiManager() {
    dio = Dio();
    dio.interceptors.add(LogInterceptor(
      logPrint: (object) => debugPrint(object.toString()),
    ));
  }

  Future<Response> getData(
      {required String endPoint,
      Map<String, dynamic>? params,
      Map<String, dynamic>? headers}) async {
    return await dio.get(AppConstants.baseUrl + endPoint,
        queryParameters: params, options: Options(headers: headers));
  }

  Future<Response> postData(
      {required String endPoint,
      Map<String, dynamic>? body,
      Map<String, dynamic>? headers}) async {
    return await dio.post(AppConstants.baseUrl + endPoint,
        data: body, options: Options(headers: headers));
  }
}
