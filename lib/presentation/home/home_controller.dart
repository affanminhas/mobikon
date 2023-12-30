import 'dart:developer';

import 'package:get/get.dart';
import 'package:mobikon/domain/container_size_model.dart';
import 'package:mobikon/repository/home_repo.dart';

class HomeController extends GetxController {
  final HomeRepository _homeRepository = HomeRepository();
  bool _isLoading = false;
  int _cameraSelectedOption = 1;
  int _shelvesSelectedOption = 1;
  List<ContainerSize> _containerSizes = [];

  bool get isLoading => _isLoading;

  int get cameraSelectedOption => _cameraSelectedOption;

  int get shelvesSelectedOption => _shelvesSelectedOption;

  void setLoading(bool value) {
    _isLoading = value;
    update();
  }

  void setContainerSizes(List<ContainerSize> value) {
    _containerSizes = value;
    update();
  }

  void setCameraSelectedOption(int value) {
    _cameraSelectedOption = value;
    update();
  }

  void setShelvesSelectedOption(int value) {
    _shelvesSelectedOption = value;
    update();
  }

  List<ContainerSize> get containerSizes => _containerSizes;

  /// Get Container Size Api Call
  Future<void> getContainerSize() async {
    try {
      List<ContainerSize> containerSizes = await _homeRepository.getContainerSize();
      setContainerSizes(containerSizes);
      update();
    } catch (e) {
      log(e.toString());
    }
  }
}
