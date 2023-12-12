import 'dart:convert';
import 'dart:developer';

import 'package:mobikon/constants/endpoints.dart';
import 'package:mobikon/extensions.dart';
import 'package:mobikon/infrastructure/exceptions.dart';
import 'package:mobikon/services/base_service.dart';
import 'package:dio/dio.dart';

abstract class SignUpService extends BaseService {
  Future<bool> signUp(String email, String password);
}

class WCAuthService extends SignUpService {
  @override
  Future<bool> signUp(String email, String password) async {
    final Map body = {
      "email": email,
      "password": password,
    };
    try {
      Response response = await dio.post(Endpoints.loginURL, data: body);

      Map<String, dynamic> signUpResponse = jsonDecode(response.data);

      log(signUpResponse.toString());
      if (response.isApiSuccessful) {
        addTokenToPayload(signUpResponse['data']['token']);
        return true;
        //return LoginResponse.fromJson(loginResponse['data']);
      } else {
        if (signUpResponse['message'] == 'Unauthorized') {
          throw ApiException("Login", response.statusCode ?? 400, "Email or Password is Incorrect");
        } else {
          throw ApiException("Login", response.statusCode ?? 400, "Network Error: Please Try Again Later");
        }
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
