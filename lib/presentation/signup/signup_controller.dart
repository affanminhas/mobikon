import 'dart:developer';

import 'package:get/get.dart';
import 'package:mobikon/repository/signup_repo.dart';

class SignUpController extends GetxController {
  final SignUpRepository _signUpRepository = SignUpRepository();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    update();
  }

  /// --- Sign Up Form Fields --- ///
  String _firstName = '';
  String _lastName = '';
  String _email = '';
  String _password = '';

  String get firstName => _firstName;

  String get lastName => _lastName;

  String get email => _email;

  String get password => _password;

  void setFirstName(String value) {
    _firstName = value;
    update();
  }

  void setLastName(String value) {
    _lastName = value;
    update();
  }

  void setEmail(String value) {
    _email = value;
    update();
  }

  void setPassword(String value) {
    _password = value;
    update();
  }

  /// --- Business Form Fields --- ///
  String _businessName = '';
  String _businessType = '';
  String _businessLocation = '';
  String _businessAddress = '';

  String get businessName => _businessName;

  String get businessType => _businessType;

  String get businessLocation => _businessLocation;

  String get businessAddress => _businessAddress;

  bool get isBusinessFormValid =>
      _businessName.isNotEmpty &&
      _businessType.isNotEmpty &&
      _businessLocation.isNotEmpty &&
      _businessAddress.isNotEmpty;

  void setBusinessName(String value) {
    _businessName = value;
    update();
  }

  void setBusinessType(String value) {
    _businessType = value;
    update();
  }

  void setBusinessLocation(String value) {
    _businessLocation = value;
    update();
  }

  void setBusinessAddress(String value) {
    _businessAddress = value;
    update();
  }

  /// Sign Up Api Call
  Future<void> signUp() async {
    try {
      setLoading(true);
      bool isRegistered = await _signUpRepository.signUp(email, password);
      if (isRegistered) {
        Get.snackbar('Success', 'Register Successful');
      } else {
        Get.snackbar('Error', 'Register Failed');
      }
    } catch (e) {
      log(e.toString());
      Get.snackbar('Error', e.toString());
    } finally {
      setLoading(false);
    }
  }
}
