import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobikon/constants/endpoints.dart';
import 'package:mobikon/extensions.dart';
import 'package:http/http.dart' as http;
import 'package:mobikon/infrastructure/exceptions.dart';
import 'package:mobikon/presentation/my_account/model/business_model.dart';
import 'package:mobikon/presentation/my_account/model/profile_model.dart';
import 'package:mobikon/services/base_service.dart';
import 'package:mobikon/services/preferences.dart';

abstract class ProfileService extends BaseService {
  Future<UserProfile> getPersonalInfo();

  Future<BusinessInfo> getBusinessInfo();

  Future<bool> updatePersonalInfo(UserProfile profile);

  Future<bool> updateBusinessInfo(BusinessInfo business);
}

class WCProfileService extends ProfileService {
  final Map<String, String> _headers = {
    "X-Api-Key": dotenv.env['X_API_KEY'] ?? '',
    "Authorization": "Bearer ${Preference.accessToken}",
  };

  @override
  Future<UserProfile> getPersonalInfo() async {
    final Map<String, String> headers = {
      "X-Api-Key": dotenv.env['X_API_KEY'] ?? '',
      "Authorization": "Bearer ${Preference.accessToken}",
    };
    try {
      Uri endpoint = Uri.parse(Endpoints.getProfileInfo);
      http.Response response = await http.get(endpoint, headers: headers);
      log(response.body.toString());

      if (response.isApiSuccessful) {
        Map<String, dynamic> apiResponse = jsonDecode(response.body);
        return UserProfile.fromMap(apiResponse['data']);
      } else {
        throw ApiException('Profile', response.statusCode, 'Error while getting personal info');
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> updatePersonalInfo(UserProfile profile) async {
    final Map body = {
      "first_name": profile.firstName,
      "last_name": profile.lastName,
      "phone": profile.phone,
    };
    try {
      Uri endpoint = Uri.parse(Endpoints.updateProfileInfo);
      http.Response response = await http.patch(endpoint, headers: _headers, body: body);
      log(response.body.toString());

      if (response.isApiSuccessful) {
        return true;
      } else {
        throw ApiException('Profile', response.statusCode, 'Error while updating personal info');
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BusinessInfo> getBusinessInfo() async {
    final Map<String, String> headers = {
      "X-Api-Key": dotenv.env['X_API_KEY'] ?? '',
      "Authorization": "Bearer ${Preference.accessToken}",
      "X-Business-ID": Preference.startedModel.business.id.toString(),
    };
    try {
      Uri endpoint = Uri.parse(Endpoints.getBusinessInfo);
      http.Response response = await http.get(endpoint, headers: headers);
      log(response.body.toString());

      if (response.isApiSuccessful) {
        log('Business Fetched Successfully');
        Map<String, dynamic> apiResponse = jsonDecode(response.body);
        return BusinessInfo.fromMap(apiResponse['data']);
      } else {
        throw ApiException('Business', response.statusCode, 'Error while getting business info');
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> updateBusinessInfo(BusinessInfo business) async {
    final Map<String, String> headers = {
      "X-Api-Key": dotenv.env['X_API_KEY'] ?? '',
      "Authorization": "Bearer ${Preference.accessToken}",
      "X-Business-ID": Preference.startedModel.business.id.toString(),
    };
    final Map body = {
      "name": business.name,
      "type": business.type,
      "description": business.description,
      "location": business.location,
    };
    try {
      Uri endpoint = Uri.parse(Endpoints.updateBusinessInfo);
      http.Response response = await http.patch(endpoint, headers: headers, body: body);
      log(response.body.toString());

      if (response.isApiSuccessful) {
        return true;
      } else {
        throw ApiException('Business', response.statusCode, 'Error while updating business info');
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
