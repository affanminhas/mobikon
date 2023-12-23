import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAccountController extends GetxController {
  int _cameraSelectedOption = 1;
  int _shelvesSelectedOption = 1;

  /// Change password
  String _currentPassword = '';
  String _newPassword = '';
  String _confirmPassword = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String get currentPassword => _currentPassword;

  String get newPassword => _newPassword;

  String get confirmPassword => _confirmPassword;

  int get cameraSelectedOption => _cameraSelectedOption;

  int get shelvesSelectedOption => _shelvesSelectedOption;

  GlobalKey<FormState> get formKey => _formKey;

  bool get isChangePasswordValid =>
      _currentPassword.isNotEmpty &&
      _newPassword.isNotEmpty &&
      _confirmPassword.isNotEmpty &&
      _newPassword == _confirmPassword;

  void setCameraSelectedOption(int value) {
    _cameraSelectedOption = value;
    update();
  }

  void setShelvesSelectedOption(int value) {
    _shelvesSelectedOption = value;
    update();
  }

  void setCurrentPassword(String value) {
    _currentPassword = value;
    update();
  }

  void setNewPassword(String value) {
    _newPassword = value;
    update();
  }

  void setConfirmPassword(String value) {
    _confirmPassword = value;
    update();
  }
}
