import 'package:get/get.dart';
import 'package:mobikon/presentation/signup/signup_controller.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SignUpController>(SignUpController());
  }
}
