import 'package:mobikon/presentation/stocks/model/shelf_model.dart';
import 'package:mobikon/presentation/stocks/model/shelf_product_model.dart';
import 'package:mobikon/presentation/stocks/model/stock_history_model.dart';
import 'package:mobikon/presentation/stocks/model/stock_post_model.dart';
import 'package:mobikon/services/stock_service.dart';

class StockRepository extends StockService {
  final WCDashboardService wcDashboardService = WCDashboardService();

  @override
  Future<StockHistory> getStockHistory() async {
    try {
      return await wcDashboardService.getStockHistory();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Shelf>> getShelves() async {
    try {
      return await wcDashboardService.getShelves();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ShelfProduct>> getShelfProducts(String shelfId) async {
    try {
      return await wcDashboardService.getShelfProducts(shelfId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> addStockEntries(List<StockPost> postData) async{
    try {
      return await wcDashboardService.addStockEntries(postData);
    } catch (e) {
      rethrow;
    }
  }
}
