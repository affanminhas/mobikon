import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobikon/domain/container_size_model.dart';
import 'package:mobikon/infrastructure/exceptions.dart';
import 'package:mobikon/presentation/signup/views/business_success_view.dart';
import 'package:mobikon/presentation/signup/views/signup_completed_view.dart';
import 'package:mobikon/presentation/signup/views/signup_form_view.dart';
import 'package:mobikon/presentation/signup/views/verify_code_view.dart';
import 'package:mobikon/repository/signup_repo.dart';

class SignUpController extends GetxController {
  final SignUpRepository _signUpRepository = SignUpRepository();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    update();
  }

  /// Verification Code Form Fields
  String _verificationCode = '';

  String get verificationCode => _verificationCode;

  void setVerificationCode(String value) {
    _verificationCode = value;
    update();
  }

  /// --- Sign Up Form Fields --- ///
  String _firstName = '';
  String _lastName = '';
  String _email = '';
  String _phoneNumber = '';
  String _password = '';
  String _confirmPassword = '';
  String _signUpEmailErrorMessage = '';
  String _signUpPasswordErrorMessage = '';
  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> _signUpPasswordFormKey = GlobalKey<FormState>();

  String get firstName => _firstName;

  String get lastName => _lastName;

  String get email => _email;

  String get phoneNumber => _phoneNumber;

  String get password => _password;

  String get confirmPassword => _confirmPassword;

  String get signUpEmailErrorMessage => _signUpEmailErrorMessage;

  String get signUpPasswordErrorMessage => _signUpPasswordErrorMessage;

  GlobalKey<FormState> get signUpFormKey => _signUpFormKey;

  GlobalKey<FormState> get signUpPasswordFormKey => _signUpPasswordFormKey;

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

  void setPhoneNumber(String value) {
    _phoneNumber = value;
    update();
  }

  void setPassword(String value) {
    _password = value;
    update();
  }

  void setConfirmPassword(String value) {
    _confirmPassword = value;
    update();
  }

  void setSignUpEmailErrorMessage(String value) {
    _signUpEmailErrorMessage = value;
    update();
  }

  void setSignUpPasswordErrorMessage(String value) {
    _signUpPasswordErrorMessage = value;
    update();
  }

  bool get isSignUpFormValid => _firstName.isNotEmpty && _lastName.isNotEmpty && _email.isNotEmpty;

  /// --- Business Form Fields --- ///
  String _businessName = '';
  String _businessType = '';
  String _businessLocation = '';
  String _businessTaxNumber = '';
  int _cameraSelectedOption = 1;
  int _shelvesSelectedOption = 1;
  ContainerSize _selectedContainerSize = ContainerSize(size: '', id: 0);
  List<ContainerSize> _containerSizes = [];
  GlobalKey<FormState> _businessFormKey = GlobalKey<FormState>();
  String _businessTaxErrorMessage = '';

  String get businessName => _businessName;

  String get businessType => _businessType;

  String get businessLocation => _businessLocation;

  String get businessTaxNumber => _businessTaxNumber;

  int get cameraSelectedOption => _cameraSelectedOption;

  int get shelvesSelectedOption => _shelvesSelectedOption;

  ContainerSize get selectedContainerSize => _selectedContainerSize;

  List<ContainerSize> get containerSizes => _containerSizes;

  GlobalKey<FormState> get businessFormKey => _businessFormKey;

  String get businessTaxErrorMessage => _businessTaxErrorMessage;

  bool get isBusinessFormValid =>
      _businessName.isNotEmpty &&
      _businessType.isNotEmpty &&
      _businessLocation.isNotEmpty &&
      _businessTaxNumber.isNotEmpty &&
      _selectedContainerSize.size.isNotEmpty;

  void setBusinessName(String value) {
    _businessName = value;
    update();
  }

  void setContainerSizes(List<ContainerSize> value) {
    _containerSizes = value;
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

  void setBusinessTaxNumber(String value) {
    _businessTaxNumber = value;
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

  void setSelectedContainerSize(ContainerSize value) {
    _selectedContainerSize = value;
    update();
  }

  void setBusinessTaxErrorMessage(String value) {
    _businessTaxErrorMessage = value;
    update();
  }

  /// Sign Up Api Call
  Future<void> signUp(BuildContext context) async {
    setSignUpEmailErrorMessage('');
    setSignUpPasswordErrorMessage('');
    try {
      setLoading(true);
      bool isRegistered = await _signUpRepository.signUp(
        firstName,
        lastName,
        email,
        password,
        phoneNumber,
      );
      if (isRegistered) {
        Get.snackbar('Success', 'Register Successful');
        Get.toNamed(SignUpCompletedView.id);
      } else {
        Get.snackbar('Error', 'Register Failed');
      }
    } on ApiException catch (e) {
      log(e.toString());
      if (e.methodName == 'Email') {
        setSignUpEmailErrorMessage(e.message);
        int count = 0;
        Navigator.of(context).popUntil((_) => count++ >= 2);
      }
      if (e.methodName == 'Password') {
        Navigator.pop(context);
        setSignUpPasswordErrorMessage(e.message);
      }
    } catch (e) {
      log(e.toString());
    } finally {
      setLoading(false);
      signUpFormKey.currentState?.validate();
      signUpPasswordFormKey.currentState?.validate();
    }
  }

  /// Register Business Api Call
  Future<void> registerBusiness(BuildContext context) async {
    try {
      setLoading(true);
      bool isRegistered = await _signUpRepository.registerBusiness(
        businessName,
        businessType,
        businessLocation,
        businessTaxNumber,
        selectedContainerSize.id,
        cameraSelectedOption == 1 ? true : false,
        shelvesSelectedOption == 1 ? true : false,
      );
      if (isRegistered) {
        Get.snackbar('Success', 'Register Successful');
        Get.toNamed(BusinessSuccessView.id);
      } else {
        Get.snackbar('Error', 'Register Failed');
      }
    } on ApiException catch (e) {
      log(e.toString());
      if (e.methodName == 'Tax') {
        print(e.message);
        setBusinessTaxErrorMessage(e.message);
      }
    } catch (e) {
      log(e.toString());
    } finally {
      setLoading(false);
      businessFormKey.currentState?.validate();
    }
  }

  /// Send Email Verification Api Call
  Future<void> sendEmailVerification() async {
    try {
      setLoading(true);
      bool isEmailSent = await _signUpRepository.sendEmailVerification(email);
      if (isEmailSent) {
        Get.snackbar('Success', 'Email Sent Successfully');
        Get.toNamed(VerifyCodeView.id);
      } else {
        Get.snackbar('Error', 'Email Sent Failed');
      }
    } catch (e) {
      log(e.toString());
      Get.snackbar('Error', e.toString());
    } finally {
      setLoading(false);
    }
  }

  /// Send Email Verification Api Call
  Future<void> resendEmailVerification() async {
    try {
      bool isEmailSent = await _signUpRepository.sendEmailVerification(email);
      if (isEmailSent) {
        Get.snackbar('Success', 'Email Sent Successfully');
      } else {
        Get.snackbar('Error', 'Email Sent Failed');
      }
    } catch (e) {
      log(e.toString());
      Get.snackbar('Error', e.toString());
    }
  }

  /// Verify Code Api Call
  Future<void> verifyEmailCode() async {
    try {
      setLoading(true);
      bool isCodeVerified = await _signUpRepository.verifyCode(email, verificationCode);
      if (isCodeVerified) {
        Get.snackbar('Success', 'Code Verified Successfully');
        Get.toNamed(SignUpFormView.id);
      } else {
        Get.snackbar('Error', 'Code Verification Failed');
      }
    } catch (e) {
      log(e.toString());
      Get.snackbar('Error', e.toString());
    } finally {
      setLoading(false);
    }
  }

  /// Get Container Size Api Call
  Future<void> getContainerSize() async {
    try {
      List<ContainerSize> containerSizes = await _signUpRepository.getContainerSize();
      setContainerSizes(containerSizes);
      update();
    } catch (e) {
      log(e.toString());
    }
  }
}
