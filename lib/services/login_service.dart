import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobikon/constants/endpoints.dart';
import 'package:mobikon/domain/auth_data_model.dart';
import 'package:mobikon/domain/get_started_model.dart';
import 'package:mobikon/extensions.dart';
import 'package:http/http.dart' as http;
import 'package:mobikon/infrastructure/exceptions.dart';
import 'package:mobikon/services/base_service.dart';
import 'package:mobikon/services/preferences.dart';

abstract class LoginService extends BaseService {
  Future<bool> login(String email, String password);

  Future<GetStartedModel> getStarted();

  Future<Map<String, dynamic>> loginRefresh();
}

class WCAuthService extends LoginService {
  final Map<String, String> _headers = {
    "X-Api-Key": dotenv.env['X_API_KEY'] ?? '',
  };

  @override
  Future<bool> login(String email, String password) async {
    final Map body = {
      "email": email,
      "password": password,
    };
    try {
      Uri endpoint = Uri.parse(Endpoints.loginURL);
      http.Response response = await http.post(endpoint, body: body, headers: _headers);
      log(response.body.toString());

      if (response.isApiSuccessful) {
        Map<String, dynamic> apiResponse = jsonDecode(response.body);
        AuthDataModel model = AuthDataModel.fromMap(apiResponse['data']);

        await Preference.saveAuthDataModel(model);
        return true;
      } else {
        throw getLoginErrorMessage(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<GetStartedModel> getStarted() async {
    final Map<String, String> headers = {
      "X-Api-Key": dotenv.env['X_API_KEY'] ?? '',
      "Authorization": "Bearer ${Preference.accessToken}",
    };
    try {
      Uri endpoint = Uri.parse(Endpoints.getStartedURL);
      http.Response response = await http.get(endpoint, headers: headers);
      log(response.body.toString());

      Map<String, dynamic> data = jsonDecode(response.body);

      if (response.isApiSuccessful) {
        GetStartedModel model = GetStartedModel.fromMap(data["data"]);
        await Preference.saveGetStartedDataModel(model);
        return model;
      } else {
        throw getLoginErrorMessage(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> loginRefresh() async {
    final Map<String, String> headers = {
      "X-Api-Key": dotenv.env['X_API_KEY'] ?? '',
    };
    final Map body = {
      "refresh": Preference.signUpModel.refresh,
    };
    try {
      Uri endpoint = Uri.parse(Endpoints.loginRefresh);
      http.Response response = await http.post(endpoint, headers: headers, body: body);
      log(response.body.toString());

      Map<String, dynamic> data = jsonDecode(response.body);

      if (response.isApiSuccessful) {
        return data["data"];
      } else {
        log('Login Refresh Error');
        throw getLoginErrorMessage(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  String getLoginErrorMessage(String responseBody) {
    final loginResponse = json.decode(responseBody);
    if (loginResponse['message'] != null) {
      return loginResponse['message'];
    } else {
      return 'Something went wrong';
    }
  }
}
