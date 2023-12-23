import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobikon/constants/endpoints.dart';
import 'package:mobikon/domain/auth_data_model.dart';
import 'package:mobikon/domain/container_size_model.dart';
import 'package:mobikon/extensions.dart';
import 'package:http/http.dart' as http;
import 'package:mobikon/infrastructure/exceptions.dart';
import 'package:mobikon/services/base_service.dart';
import 'package:mobikon/services/preferences.dart';

abstract class SignUpService extends BaseService {
  Future<bool> signUp(
    String firstName,
    String lastName,
    String email,
    String password,
    String phoneNumber,
  );

  Future<bool> registerBusiness(
    String businessName,
    String businessType,
    String businessLocation,
    String taxNumber,
    int containerSize,
    bool hasCamera,
    bool hasShelves,
  );

  Future<List<ContainerSize>> getContainerSize();

  Future<bool> sendEmailVerification(String email);

  Future<bool> verifyCode(String email, String code);
}

class WCAuthService extends SignUpService {
  final Map<String, String> _headers = {
    "X-Api-Key": dotenv.env['X_API_KEY'] ?? '',
  };

  @override
  Future<bool> signUp(
    String firstName,
    String lastName,
    String email,
    String password,
    String phoneNumber,
  ) async {
    final Map body = {
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "password": password,
      "phone": phoneNumber,
    };
    try {
      Uri endpoint = Uri.parse(Endpoints.signupURL);
      http.Response response = await http.post(endpoint, body: body, headers: _headers);
      log(response.body.toString());

      if (response.isApiSuccessful) {
        Map<String, dynamic> apiResponse = jsonDecode(response.body);

        AuthDataModel model = AuthDataModel.fromMap(apiResponse['data']);

        await Preference.saveAuthDataModel(model);
        return true;
      } else {
        throw getErrorMessage(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> registerBusiness(
    String businessName,
    String businessType,
    String businessLocation,
    String taxNumber,
    int containerSize,
    bool hasCamera,
    bool hasShelves,
  ) async {
    final Map<String, String> headers = {
      "X-Api-Key": dotenv.env['X_API_KEY'] ?? '',
      "Authorization": "Bearer ${Preference.accessToken}",
      'Content-Type': 'application/json',
    };

    final Map<String, dynamic> body = {
      'business': {
        'name': businessName,
        'type': businessType,
        'location': businessLocation,
        'tax_number': taxNumber,
      },
      'container_preferences': {
        'size': containerSize,
        'has_camera': hasCamera,
        'has_shelves': hasShelves,
      }
    };

    print(body.toString());

    try {
      Uri endpoint = Uri.parse(Endpoints.businessURL);
      http.Response response = await http.post(endpoint, body: jsonEncode(body), headers: headers);
      log(response.body.toString());

      Map<String, dynamic> apiResponse = jsonDecode(response.body);

      log(apiResponse.toString());
      if (response.isApiSuccessful) {
        return true;
      } else {
        throw getBusinessErrorMessage(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> sendEmailVerification(String email) async {
    final Map body = {"email": email};
    try {
      Uri endpoint = Uri.parse(Endpoints.sendEmailCodeURL);
      http.Response response = await http.post(endpoint, body: body, headers: _headers);
      log(response.body.toString());

      Map<String, dynamic> apiResponse = jsonDecode(response.body);

      log(apiResponse.toString());
      if (response.isApiSuccessful) {
        return true;
      } else {
        throw getErrorMessage(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> verifyCode(String email, String code) async {
    final Map body = {
      "email": email,
      "code": code,
    };
    try {
      Uri endpoint = Uri.parse(Endpoints.verifyCodeURL);
      http.Response response = await http.patch(endpoint, body: body, headers: _headers);
      log(response.body.toString());

      Map<String, dynamic> apiResponse = jsonDecode(response.body);

      log(apiResponse.toString());
      if (response.isApiSuccessful) {
        return true;
      } else {
        throw getErrorMessage(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ContainerSize>> getContainerSize() async {
    final Map<String, String> headers = {
      "X-Api-Key": dotenv.env['X_API_KEY'] ?? '',
      "Authorization": "Bearer ${Preference.accessToken}",
    };
    try {
      Uri endpoint = Uri.parse(Endpoints.warehouseURL);
      http.Response response = await http.get(endpoint, headers: headers);
      log(response.body.toString());

      Map<String, dynamic> apiResponse = jsonDecode(response.body);

      List<ContainerSize> containerSizeList =
          List.from(apiResponse['data']).map((e) => ContainerSize.fromMap(e)).toList();

      if (response.isApiSuccessful) {
        return containerSizeList;
      } else {
        throw getErrorMessage(response.body);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  ApiException getErrorMessage(String responseBody) {
    final response = json.decode(responseBody);
    if (response['message'] != null) {
      return ApiException("Login", 400, response['message']);
      //return response['message'];
    } else {
      try {
        return ApiException("Email", 400, response['data']['email'][0]);
        //return response['data']['email'][0];
      } catch (e) {
        try {
          return ApiException("Password", 400, response['data']['password'][0]);
          //return response['data']['password'][0];
        } catch (e) {
          try {
            return ApiException("Phone", 400, response['data']['phone'][0]);
            //return response['data']['phone'][0];
          } catch (e) {
            try {
              return ApiException("Code", 400, response['data']['code'][0]);
              //return response['data']['code'][0];
            } catch (e) {
              return ApiException("Error", 400, 'Something went wrong');
              //return 'Something went wrong';
            }
          }
        }
      }
    }
  }

  ApiException getBusinessErrorMessage(String responseBody) {
    final response = json.decode(responseBody);
    if (response['message'] != null) {
      return ApiException("Business Form", 400, response['message']);
      //return response['message'];
    } else {
      try {
        return ApiException("Tax", 400, response['data']['business']['tax_number'][0]);
        //return response['data']['business']['tax_number'][0];
      } catch (e) {
        return ApiException("Error", 400, 'Something went wrong');
        //return 'Something went wrong';
      }
    }
  }
}
