import 'package:get/get.dart';
import 'package:mobikon/presentation/forgot_password/forgot_password_controller.dart';
import 'package:mobikon/presentation/home/home_controller.dart';
import 'package:mobikon/presentation/login/login_controller.dart';
import 'package:mobikon/presentation/my_account/profile_controller.dart';
import 'package:mobikon/presentation/products/controller/product_controller.dart';
import 'package:mobikon/presentation/signup/signup_controller.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SignUpController>(SignUpController());
    Get.put<LoginController>(LoginController());
    Get.put<ForgotPasswordController>(ForgotPasswordController());
    Get.put<ProductController>(ProductController());
    Get.put<ProfileController>(ProfileController());
    Get.put<HomeController>(HomeController());
  }
}
