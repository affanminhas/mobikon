
import 'package:dio/dio.dart';

extension ApiExtension on Response {
  bool get isApiSuccessful => statusCode! >= 200 && statusCode! <= 205;
}
