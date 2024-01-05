import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobikon/constants/endpoints.dart';
import 'package:mobikon/extensions.dart';
import 'package:http/http.dart' as http;
import 'package:mobikon/infrastructure/exceptions.dart';
import 'package:mobikon/presentation/products/model/product_model.dart';
import 'package:mobikon/services/base_service.dart';
import 'package:mobikon/services/preferences.dart';

abstract class ProductService extends BaseService {
  Future<List<Product>> getAllProducts();

  Future<bool> createProduct(Product product);

  Future<bool> updateProduct(Product product);

  Future<Product> getSingleProduct(int productId);
}

class WCDashboardService extends ProductService {
  // final Map<String, String> _headers = {
  //   "X-Api-Key": dotenv.env['X_API_KEY'] ?? '',
  //   "Authorization": "Bearer ${Preference.accessToken}",
  //   "X-Business-ID": Preference.startedModel.business.id.toString(),
  // };

  @override
  Future<List<Product>> getAllProducts() async {
    final Map<String, String> headers = {
      "X-Api-Key": dotenv.env['X_API_KEY'] ?? '',
      "Authorization": "Bearer ${Preference.accessToken}",
      "X-Business-ID": Preference.startedModel.business.id.toString(),
    };
    try {
      Uri endpoint = Uri.parse(Endpoints.getProducts);
      http.Response response = await http.get(endpoint, headers: headers);
      log(response.body.toString());

      if (response.isApiSuccessful) {
        Map<String, dynamic> apiResponse = jsonDecode(response.body);
        List<Product> productList = List.from(apiResponse['data']).map((e) => Product.fromMap(e)).toList();
        return productList;
      } else {
        throw ApiException('Profile', response.statusCode, 'Error while getting products');
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> createProduct(Product product) async {
    final Map<String, String> headers = {
      "X-Api-Key": dotenv.env['X_API_KEY'] ?? '',
      "Authorization": "Bearer ${Preference.accessToken}",
      "X-Business-ID": Preference.startedModel.business.id.toString(),
    };
    var request = http.MultipartRequest('POST', Uri.parse(Endpoints.createProducts));
    request.fields.addAll(product.toMap());
    request.files.add(
      await http.MultipartFile.fromPath('thumbnail', product.thumbnail),
    );
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      log(await response.stream.bytesToString());
      return true;
    } else {
      log(response.reasonPhrase.toString());
      return false;
    }
  }

  @override
  Future<Product> getSingleProduct(int productId) async {
    final Map<String, String> headers = {
      "X-Api-Key": dotenv.env['X_API_KEY'] ?? '',
      "Authorization": "Bearer ${Preference.accessToken}",
      "X-Business-ID": Preference.startedModel.business.id.toString(),
    };
    try {
      Uri endpoint = Uri.parse('${Endpoints.getProducts}$productId/');
      http.Response response = await http.get(endpoint, headers: headers);
      log(response.body.toString());

      if (response.isApiSuccessful) {
        Map<String, dynamic> apiResponse = jsonDecode(response.body);
        Product product = Product.fromMap(apiResponse['data']);
        return product;
      } else {
        throw ApiException('Profile', response.statusCode, 'Error while getting single product');
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> updateProduct(Product product) async {
    final Map<String, String> headers = {
      "X-Api-Key": dotenv.env['X_API_KEY'] ?? '',
      "Authorization": "Bearer ${Preference.accessToken}",
      "X-Business-ID": Preference.startedModel.business.id.toString(),
    };
    try {
      var request = http.MultipartRequest('PATCH', Uri.parse('${Endpoints.getProducts}${product.id}/'));
      request.fields.addAll(product.updateProductMap());
      log('Thumbnail: ${product.thumbnail}');
      if (product.thumbnail.isNotEmpty) {
        request.files.add(
          await http.MultipartFile.fromPath('thumbnail', product.thumbnail),
        );
      }
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      log(response.request.toString());

      if (response.statusCode == 200) {
        log(await response.stream.bytesToString());
        return true;
      } else {
        log(response.reasonPhrase.toString());
        return false;
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
