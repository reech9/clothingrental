import 'package:clothingrental/models/user.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../response/loginresponse.dart';
import '../utils/url.dart';
import 'httpservices.dart';

class UserAPI {
  Future<bool> registerUser(User user) async {
    bool isLogin = false;
    // response comes from server
    Response response;
    var url = baseUrl + registerUrl;

    var dio = HttpServices().getInstance();
    try {
      response = await dio.post(
        url,
        data: user.toJson(),
      );
      if (response.statusCode == 200) {
        isLogin = true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isLogin;
  }

  Future<bool> login(String username, String password) async {
    bool isLogin = false;
    try {
      var url = baseUrl + loginUrl;
      var dio = HttpServices().getInstance();

      var response = await dio.post(
        url,
        data: {
          "username": username,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        LoginResponse loginResponse = LoginResponse.fromJson(response.data);
        token = loginResponse.token;
        isLogin = true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isLogin;
  }
}
