import 'package:dio/dio.dart';

abstract class ApiService {
  Future<Map<String, dynamic>> get(
      {required String url,
      Map<String, dynamic>? headers,
      CancelToken? cancelToken});
  Future<Map<String, dynamic>> post({
    required String url,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? data,
  });
  Future<dynamic> delete({required String url, Map<String, dynamic>? headers});
  Future<Map<String, dynamic>> put(
      {required String url,
      Map<String, dynamic>? headers,
      required Map<String, dynamic> data});
  Future<Map<String, dynamic>> patch(
      {required String url,
      Map<String, dynamic>? headers,
      required Map<String, dynamic> data});
}
