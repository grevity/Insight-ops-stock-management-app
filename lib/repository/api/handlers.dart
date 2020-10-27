import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:stock_management/repository/api/constants.dart';

class ApiHandlers {
  ApiConstants apiConstants = ApiConstants();
  Dio dio = new Dio();

  Future<Response> login(String email, String password) async {
    print(email);
    print(password);
    Response response = await dio.post(apiConstants.version1.login,
      data: {
        "email": email,
        "password": password
      }
    );
    return response;
  }
}