import 'package:mobikon/presentation/products/model/product_model.dart';
import 'package:mobikon/services/product_service.dart';

class ProductRepository extends ProductService {
  final WCDashboardService wcDashboardService = WCDashboardService();

  @override
  Future<List<Product>> getAllProducts() async {
    try {
      return await wcDashboardService.getAllProducts();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> createProduct(Product product) async {
    try {
      return await wcDashboardService.createProduct(product);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Product> getSingleProduct(int productId) async {
    try {
      return await wcDashboardService.getSingleProduct(productId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> updateProduct(Product product) async {
    try {
      return await wcDashboardService.updateProduct(product);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> deleteProduct(String productId) async{
    try {
      return await wcDashboardService.deleteProduct(productId);
    } catch (e) {
      rethrow;
    }
  }
}
