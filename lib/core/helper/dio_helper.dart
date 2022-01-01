import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "http://192.168.1.6:3000/api/",
        receiveDataWhenStatusError: true,
        sendTimeout: 20 * 1000,
        connectTimeout: 20 * 1000,
        receiveTimeout: 20 * 1000,
      ),
    );
  }

  // fetch data from server
  static Future<Response> fetchData({
    String? token,
    required String url,
    Map<String, dynamic>? query,
  }) async {
    dio!.options.headers = {
      "Content-Type": "application/json",
      "Authorization": token ?? "",
    };
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }

  // post data to server
  static Future<Response> postData({
    String? token,
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    dio!.options.headers = {
      "Content-Type": "application/json",
      "Authorization": token ?? "",
    };
    return await dio!.post(
      url,
      data: data,
      queryParameters: query,
    );
  }

  static Future<Response> putData({
    String? token,
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    dio!.options.headers = {
      "Content-Type": "application/json",
      "Authorization": token ?? "",
    };
    return await dio!.put(
      url,
      data: data,
      queryParameters: query,
    );
  }

  static Future<Response> deleteData({
    String? token,
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    dio!.options.headers = {
      "Content-Type": "application/json",
      "Authorization": token ?? "",
    };
    return await dio!.delete(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
