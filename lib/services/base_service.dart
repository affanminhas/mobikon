import 'dart:io';

import 'package:dio/dio.dart';

abstract class BaseService {
  final dio = Dio();
  Map<String, String> payLoad = {
    HttpHeaders.acceptHeader: 'application/json',
    HttpHeaders.contentTypeHeader: 'application/json',
  };

  void addTokenToPayload(String token) {
    payLoad.addAll({'Authorization': 'Bearer $token'});
  }
}
