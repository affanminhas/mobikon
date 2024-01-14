import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobikon/constants/endpoints.dart';
import 'package:mobikon/extensions.dart';
import 'package:http/http.dart' as http;
import 'package:mobikon/infrastructure/exceptions.dart';
import 'package:mobikon/presentation/stocks/model/shelf_model.dart';
import 'package:mobikon/presentation/stocks/model/shelf_product_model.dart';
import 'package:mobikon/presentation/stocks/model/stock_history_model.dart';
import 'package:mobikon/presentation/stocks/model/stock_post_model.dart';
import 'package:mobikon/services/base_service.dart';
import 'package:mobikon/services/preferences.dart';

abstract class StockService extends BaseService {
  Future<StockHistory> getStockHistory();

  Future<List<Shelf>> getShelves();

  Future<List<ShelfProduct>> getShelfProducts(String shelfId);

  Future<bool> addStockEntries(List<StockPost> postData);
}

class WCDashboardService extends StockService {
  @override
  Future<StockHistory> getStockHistory() async {
    final Map<String, String> headers = {
      "X-Api-Key": dotenv.env['X_API_KEY'] ?? '',
      "Authorization": "Bearer ${Preference.accessToken}",
      "X-Business-ID": Preference.startedModel.business.id.toString(),
    };
    try {
      Uri endpoint = Uri.parse(Endpoints.stockHistoryURL);
      http.Response response = await http.get(endpoint, headers: headers);
      log(response.body.toString());

      Map<String, dynamic> data = jsonDecode(response.body);

      if (response.isApiSuccessful) {
        StockHistory model = StockHistory.fromMap(data["data"]);
        return model;
      } else {
        throw Exception(data["message"]);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Shelf>> getShelves() async {
    final Map<String, String> headers = {
      "X-Api-Key": dotenv.env['X_API_KEY'] ?? '',
      "Authorization": "Bearer ${Preference.accessToken}",
      "X-Business-ID": Preference.startedModel.business.id.toString(),
    };
    try {
      Uri endpoint = Uri.parse(Endpoints.shelvesURL);
      http.Response response = await http.get(endpoint, headers: headers);
      log(response.body.toString());

      Map<String, dynamic> data = jsonDecode(response.body);

      if (response.isApiSuccessful) {
        List<Shelf> model = List<Shelf>.from(data["data"].map((x) => Shelf.fromMap(x)).toList());
        return model;
      } else {
        throw Exception(data["message"]);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ShelfProduct>> getShelfProducts(String shelfId) async {
    final Map<String, String> headers = {
      "X-Api-Key": dotenv.env['X_API_KEY'] ?? '',
      "Authorization": "Bearer ${Preference.accessToken}",
      "X-Business-ID": Preference.startedModel.business.id.toString(),
    };
    try {
      Uri endpoint = Uri.parse('${Endpoints.shelvesURL}/$shelfId/products');
      http.Response response = await http.get(endpoint, headers: headers);
      log(response.body.toString());

      Map<String, dynamic> data = jsonDecode(response.body);

      if (response.isApiSuccessful) {
        List<ShelfProduct> model = List<ShelfProduct>.from(data["data"].map((x) => ShelfProduct.fromMap(x)).toList());
        return model;
      } else {
        throw Exception(data["message"]);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> addStockEntries(List<StockPost> postData) async {
    final Map<String, String> headers = {
      "X-Api-Key": dotenv.env['X_API_KEY'] ?? '',
      "Authorization": "Bearer ${Preference.accessToken}",
      "X-Business-ID": Preference.startedModel.business.id.toString(),
      "Content-Type": "application/json",
    };
    try {
      Uri endpoint = Uri.parse(Endpoints.stockHistoryURL);
      String body = jsonEncode(postData.map((e) => e.toMap()).toList());
      http.Response response = await http.post(endpoint, headers: headers, body: body);
      log(response.body.toString());

      Map<String, dynamic> data = jsonDecode(response.body);

      if (response.isApiSuccessful) {
        return true;
      } else {
        throw Exception(data["message"]);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
