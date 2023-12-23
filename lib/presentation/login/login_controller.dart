import 'dart:developer';

import 'package:get/get.dart';
import 'package:mobikon/presentation/dashboard/dashboard_view.dart';
import 'package:mobikon/presentation/app_views/approval_view.dart';
import 'package:mobikon/presentation/signup/views/business_form_view.dart';
import 'package:mobikon/repository/login_repo.dart';

class LoginController extends GetxController {
  final LoginRepository _loginRepository = LoginRepository();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

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

  void setLoading(bool value) {
    _isLoading = value;
    update();
  }

  /// Login Api Call
  Future<void> login() async {
    try {
      setLoading(true);
      bool isLoggedIn = await _loginRepository.login(email, password);
      Map<String, dynamic> data = await _loginRepository.getStarted();
      if (isLoggedIn) {
        Get.snackbar('Success', 'Login Successful!');
        if (data['is_business_registered'] == false) {
          Get.toNamed(BusinessFormView.id);
        } else if (data['is_business_approved'] == false) {
          Get.toNamed(ApprovalView.id);
        } else {
          Get.toNamed(DashboardView.id);
        }
      } else {
        Get.snackbar('Error', 'Login Failed');
      }
    } catch (e) {
      log(e.toString());
    } finally {
      setLoading(false);
    }
  }

  Future<void> checkUserRegistration() async {
    try {
      Map<String, dynamic> data = await _loginRepository.getStarted();
      if (data['is_business_registered'] == false) {
        Get.toNamed(BusinessFormView.id);
      } else if (data['is_business_approved'] == false) {
        Get.toNamed(ApprovalView.id);
      } else {
        Get.toNamed(DashboardView.id);
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
