import 'package:get/get.dart';

class StockController extends GetxController {
  int _stockTypeSelectedOption = 2;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  int get stockTypeSelectedOption => _stockTypeSelectedOption;


  void setStockTypeSelectedOption(int value) {
    _stockTypeSelectedOption = value;
    update();
  }

  void setLoading(bool value) {
    _isLoading = value;
    update();
  }
}
