import 'package:get/get.dart';

class LoginController extends GetxController {
  /// --- Login Form Fields --- ///
  String _email = '';
  String _password = '';

  String get email => _email;

  String get password => _password;

  bool get isLoginFormValid => _email.isNotEmpty && _password.isNotEmpty;

  void setEmail(String value) {
    _email = value;
    update();
  }

  void setPassword(String value) {
    _password = value;
    update();
  }
}
