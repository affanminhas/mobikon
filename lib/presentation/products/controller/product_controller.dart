import 'dart:developer';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobikon/presentation/products/model/product_model.dart';
import 'package:mobikon/repository/product_repo.dart';

class ProductController extends GetxController {
  final ProductRepository _productRepository = ProductRepository();
  bool _isLoading = false;
  String _searchText = '';
  List<Product> _productList = [];
  Product _selectedProduct = Product.initial();
  List<Product> _filteredProductList = [];
  String _productName = '';
  String _productDescription = '';
  String _productType = '';
  String _productID = '';
  XFile _productThumbnail = XFile('');
  XFile _productEditThumbnail = XFile('');

  bool get isLoading => _isLoading;

  List<Product> get productList => _productList;

  List<Product> get filteredProductList => _filteredProductList;

  String get searchText => _searchText;

  String get productName => _productName;

  String get productDescription => _productDescription;

  String get productType => _productType;

  XFile get productThumbnail => _productThumbnail;

  XFile get productEditThumbnail => _productEditThumbnail;

  String get productID => _productID;

  Product get selectedProduct => _selectedProduct;

  bool get isFormValid => _productName.isNotEmpty && _productType.isNotEmpty && _productThumbnail.path.isNotEmpty;

  void setLoading(bool value) {
    _isLoading = value;
    update();
  }

  void setProductName(String value) {
    _productName = value;
    update();
  }

  void setProductDescription(String value) {
    _productDescription = value;
    update();
  }

  void setProductType(String value) {
    _productType = value;
    update();
  }

  void setProductThumbnail(XFile value) {
    _productThumbnail = value;
    update();
  }

  void setProductEditThumbnail(XFile value) {
    _productEditThumbnail = value;
    update();
  }

  void setProductID(String value) {
    _productID = value;
    update();
  }

  void setSelectedProduct(Product value) {
    setProductEditThumbnail(XFile(value.thumbnail));
    _selectedProduct = value;
    update();
  }

  void onSearchProduct(String value) {
    _searchText = value;
    _filteredProductList =
        _productList.where((element) => element.name.toLowerCase().contains(value.toLowerCase())).toList();
    update();
  }

  /// Get All Products Api Call
  Future<void> getAllProducts() async {
    setLoading(true);
    try {
      _productList = await _productRepository.getAllProducts();
    } catch (e) {
      log(e.toString());
    } finally {
      setLoading(false);
    }
  }

  /// Get Single Products Api Call
  Future<void> getProduct(int productId) async {
    setLoading(true);
    try {
      _selectedProduct = await _productRepository.getSingleProduct(productId);
    } catch (e) {
      log(e.toString());
    } finally {
      setLoading(false);
    }
  }

  /// Create Product Api Call
  Future<void> createProduct() async {
    setLoading(true);
    Product product = Product(
      name: _productName,
      description: _productDescription,
      type: _productType,
      thumbnail: _productThumbnail.path,
      id: 0,
      quantity: 0,
      quantityInShelf: 0,
      productId: _productID,
    );
    try {
      await _productRepository.createProduct(product);
      await getAllProducts();
      setProductThumbnail(XFile(''));
      Get.back();
    } catch (e) {
      log(e.toString());
    } finally {
      setLoading(false);
    }
  }

  /// Update Product Api Call
  Future<void> updateProduct() async {
    setLoading(true);
    Product product = Product(
      name: _productName.isNotEmpty ? _productName : selectedProduct.name,
      description: _productDescription.isNotEmpty ? _productDescription : selectedProduct.description,
      type: _productType.isNotEmpty ? _productType : selectedProduct.type,
      thumbnail: productEditThumbnail.path.isNotEmpty ? productEditThumbnail.path : '',
      id: selectedProduct.id,
      quantity: 0,
      quantityInShelf: 0,
      productId: _productID,
    );
    try {
      await _productRepository.updateProduct(product);
      await getProduct(selectedProduct.id);
      await getAllProducts();
      setProductEditThumbnail(XFile(''));
      Get.back();
    } catch (e) {
      log(e.toString());
    } finally {
      setLoading(false);
    }
  }
}
