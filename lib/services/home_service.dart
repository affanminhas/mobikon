import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobikon/constants/endpoints.dart';
import 'package:mobikon/domain/container_size_model.dart';
import 'package:mobikon/extensions.dart';
import 'package:http/http.dart' as http;
import 'package:mobikon/infrastructure/exceptions.dart';
import 'package:mobikon/presentation/home/model/container_model.dart';
import 'package:mobikon/services/base_service.dart';
import 'package:mobikon/services/preferences.dart';

abstract class HomeService extends BaseService {
  Future<List<ContainerSize>> getContainerSize();

  Future<List<UserContainer>> getAllContainers();
}

class WCDashboardService extends HomeService {
  // final Map<String, String> _headers = {
  //   "X-Api-Key": dotenv.env['X_API_KEY'] ?? '',
  // };

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
        throw ApiException('Container Sizes', response.statusCode, apiResponse['message']);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<UserContainer>> getAllContainers() async {
    final Map<String, String> headers = {
      "X-Api-Key": dotenv.env['X_API_KEY'] ?? '',
      "Authorization": "Bearer ${Preference.accessToken}",
      "X-Business-ID": Preference.startedModel.business.id.toString(),
    };
    try {
      Uri endpoint = Uri.parse(Endpoints.getAllContainers);
      http.Response response = await http.get(endpoint, headers: headers);
      log(response.body.toString());

      Map<String, dynamic> apiResponse = jsonDecode(response.body);

      List<UserContainer> containers = List.from(apiResponse['data']).map((e) => UserContainer.fromMap(e)).toList();

      if (response.isApiSuccessful) {
        return containers;
      } else {
        throw ApiException('User Container', response.statusCode, apiResponse['message']);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
