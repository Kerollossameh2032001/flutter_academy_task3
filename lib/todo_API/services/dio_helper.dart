import 'package:dio/dio.dart';
import 'package:flutter_academy_task3/todo_API/services/api_constant.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      receiveDataWhenStatusError: true,
      baseUrl: ApiConstant.baseUrl,
    ));
  }

  static Future<Response> getData({
    required String endPoint,
  }) async {
    return await dio.get(endPoint);
  }
}
