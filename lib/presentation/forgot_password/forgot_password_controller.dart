import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  /// --- Forgot Password Fields --- ///
  String _email = '';

  String get email => _email;

  bool get isFormValid => _email.isNotEmpty;

  void setEmail(String value) {
    _email = value;
    update();
  }
}
