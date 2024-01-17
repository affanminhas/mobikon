import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobikon/presentation/stocks/model/shelf_model.dart';
import 'package:mobikon/presentation/stocks/model/shelf_product_model.dart';
import 'package:mobikon/presentation/stocks/model/stock_history_model.dart';
import 'package:mobikon/presentation/stocks/model/stock_post_model.dart';
import 'package:mobikon/repository/stock_repo.dart';

class StockController extends GetxController {
  final StockRepository _stockRepository = StockRepository();

  int _stockTypeSelectedOption = 2;

  StockHistory _stockHistory = StockHistory.idle();
  List<Shelf> _shelves = [];
  List<ShelfProduct> _shelfProduct = [];
  List<Shelf> _filteredShelves = [];
  List<ShelfProduct> _filteredShelfProducts = [];
  String _shelfSearchText = '';
  String _shelfProductSearchText = '';
  Shelf _selectedShelf = Shelf.idle();
  ShelfProduct _selectedShelfProduct = ShelfProduct.idle();
  String _shelfProductQuantity = '';

  /// Stock Entries
  List<StockPost> _stockPostList = [];

  final TextEditingController _shelfController = TextEditingController();
  final TextEditingController _shelfProductController = TextEditingController();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  int get stockTypeSelectedOption => _stockTypeSelectedOption;

  List<Shelf> get shelves => _shelves;

  List<ShelfProduct> get shelfProduct => _shelfProduct;

  String get shelfSearchText => _shelfSearchText;

  String get shelfProductSearchText => _shelfProductSearchText;

  List<Shelf> get filteredShelves => _filteredShelves;

  List<ShelfProduct> get filteredShelfProducts => _filteredShelfProducts;

  List<StockPost> get stockPostList => _stockPostList;

  StockHistory get stockHistory => _stockHistory;

  TextEditingController get shelfController => _shelfController;

  TextEditingController get shelfProductController => _shelfProductController;

  String get shelfProductQuantity => _shelfProductQuantity;

  bool get isFormValid =>
      _shelfController.text.isNotEmpty && _shelfProductController.text.isNotEmpty && shelfProductQuantity.isNotEmpty;

  void onSearchShelf(String value) {
    _shelfSearchText = value;
    _filteredShelves = _shelves.where((element) => element.name.toLowerCase().contains(value.toLowerCase())).toList();
    update();
  }

  void onSearchShelfProduct(String value) {
    _shelfProductSearchText = value;
    _filteredShelfProducts =
        _shelfProduct.where((element) => element.name.toLowerCase().contains(value.toLowerCase())).toList();
    update();
  }

  void setStockTypeSelectedOption(int value) {
    _stockTypeSelectedOption = value;
    update();
  }

  void setLoading(bool value) {
    _isLoading = value;
    update();
  }

  void setStockHistory(StockHistory value) {
    _stockHistory = value;
    update();
  }

  void setShelfProductQuantity(String value) {
    _shelfProductQuantity = value;
    update();
  }

  void setSelectedShelves(Shelf value) {
    _selectedShelf = value;
    _shelfController.text = value.name;
    update();
  }

  void setSelectedShelfProduct(ShelfProduct value) {
    _selectedShelfProduct = value;
    _shelfProductController.text = value.name;
    update();
  }

  void removeStockPost(int index) {
    _stockPostList.removeAt(index);
    update();
  }

  void reset() {
    _stockTypeSelectedOption = 2;
    _stockHistory = StockHistory.idle();
    _isLoading = false;
    _filteredShelves = [];
    _filteredShelfProducts = [];
    _shelfSearchText = '';
    _shelfProductSearchText = '';
    _selectedShelf = Shelf.idle();
    _selectedShelfProduct = ShelfProduct.idle();
    _shelfProductQuantity = '';
    _shelfController.clear();
    _shelfProductController.clear();
    update();
  }

  void onSaveStock(bool isSaveAndAdd) {
    _stockPostList.add(
      StockPost(
        quantity: int.parse(_shelfProductQuantity),
        type: _stockTypeSelectedOption == 1 ? 'R' : 'A',
        stock: _selectedShelfProduct.id,
        shelf: _selectedShelf.id,
        productName: _selectedShelfProduct.name,
        shelfName: _selectedShelf.name,
      ),
    );
    reset();
    if (isSaveAndAdd == false) Get.back();
    update();
  }

  Future<void> getAllStockHistory() async {
    try {
      setLoading(true);
      StockHistory stockHistory = await _stockRepository.getStockHistory();
      setStockHistory(stockHistory);
    } catch (e) {
      rethrow;
    } finally {
      setLoading(false);
    }
  }

  Future<void> getAllShelves() async {
    try {
      List<Shelf> shelves = await _stockRepository.getShelves();
      _shelves = shelves;
      update();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getAllShelfProducts(String shelfId) async {
    try {
      List<ShelfProduct> shelfProducts = await _stockRepository.getShelfProducts(shelfId);
      _shelfProduct = shelfProducts;
      update();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addStockEntries() async {
    try {
      setLoading(true);
      bool isAdded = await _stockRepository.addStockEntries(_stockPostList);
      if (isAdded) {
        await getAllStockHistory();
        _stockPostList.clear();
        Get.back();
        //Get.snackbar('Success', 'Stock Entries Added Successfully');
        // Future.delayed(const Duration(seconds: 3), () {
        //   Get.back();
        // });
      }
    } catch (e) {
      rethrow;
    } finally {
      setLoading(false);
    }
  }
}
