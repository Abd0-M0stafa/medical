import 'package:medical/core/networking/api_constance.dart';

abstract class ApiHeaders {
  static late Map<String, dynamic> apiHeadersWithToken;
  static void initApiHeadersWithToken() {
    apiHeadersWithToken = {'Authorization': 'Bearer ${ApiConstsance.apiKey}'};
  }
}
