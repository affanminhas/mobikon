import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobikon/presentation/my_account/model/business_model.dart';
import 'package:mobikon/presentation/my_account/model/profile_model.dart';
import 'package:mobikon/presentation/welcome/welcome_view.dart';
import 'package:mobikon/repository/profile_repo.dart';
import 'package:mobikon/services/preferences.dart';
import 'package:mobikon/widgets/custom_popup.dart';

class ProfileController extends GetxController {
  final ProfileRepository _profileRepository = ProfileRepository();
  int _cameraSelectedOption = 1;
  int _shelvesSelectedOption = 1;

  UserProfile profile = UserProfile.idle();

  BusinessInfo businessInfo = BusinessInfo.idle();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  /// --- Profile Edit Form Fields --- ///
  String _firstName = '';
  String _lastName = '';
  String _email = '';
  String _mobile = '';

  String get firstName => _firstName;

  String get lastName => _lastName;

  String get email => _email;

  String get mobile => _mobile;

  bool get isProfileEditFormValid =>
      _firstName.isNotEmpty && _lastName.isNotEmpty && _email.isNotEmpty && _mobile.isNotEmpty;

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

  void setMobile(String value) {
    _mobile = value;
    update();
  }

  void setInitialFormField() {
    _firstName = profile.firstName;
    _lastName = profile.lastName;
    _email = profile.email;
    _mobile = profile.phone;
    update();
  }

  /// --- Business Form Fields ---
  String _businessName = '';
  String _businessType = '';
  String _businessDescription = '';
  String _businessLocation = '';
  String _businessTaxNumber = '';
  bool _isCameraReq = false;
  bool _isShelvesReq = false;

  String get businessName => _businessName;

  String get businessType => _businessType;

  String get businessDescription => _businessDescription;

  String get businessLocation => _businessLocation;

  String get businessTaxNumber => _businessTaxNumber;

  bool get isCameraReq => _isCameraReq;

  bool get isShelvesReq => _isShelvesReq;

  bool get isBusinessEditFormValid =>
      _businessName.isNotEmpty &&
      _businessType.isNotEmpty &&
      _businessTaxNumber.isNotEmpty &&
      _businessLocation.isNotEmpty;

  void setBusinessName(String value) {
    _businessName = value;
    update();
  }

  void setBusinessType(String value) {
    _businessType = value;
    update();
  }

  void setBusinessDescription(String value) {
    _businessDescription = value;
    update();
  }

  void setBusinessLocation(String value) {
    _businessLocation = value;
    update();
  }

  void setIsCameraReq(bool value) {
    _isCameraReq = value;
    update();
  }

  void setIsShelvesReq(bool value) {
    _isShelvesReq = value;
    update();
  }

  void setBusinessTaxNumber(String value) {
    _businessTaxNumber = value;
    update();
  }

  void setInitialBusinessFormField() {
    _businessName = businessInfo.name;
    _businessType = businessInfo.type;
    _businessDescription = businessInfo.description;
    _businessLocation = businessInfo.location;
    _businessTaxNumber = businessInfo.taxNumber;
    // _isCameraReq = businessInfo.isCameraRequired;
    // _isShelvesReq = businessInfo.isShelvesRequired;
    update();
  }

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

  void setLoading(bool value) {
    _isLoading = value;
    update();
  }

  /// Get User Profile Api Call
  Future<void> getUserProfileInfo() async {
    try {
      profile = await _profileRepository.getPersonalInfo();
      setInitialFormField();
    } catch (e) {
      log(e.toString());
    }
  }

  /// Get User Business Profile Api Call
  Future<void> getUserBusinessInfo() async {
    try {
      businessInfo = await _profileRepository.getBusinessInfo();
      setInitialBusinessFormField();
    } catch (e) {
      log(e.toString());
    }
  }

  /// Update User Profile Api Call
  Future<void> updateUserProfileInfo(BuildContext context) async {
    try {
      setLoading(true);
      UserProfile profile = UserProfile(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: mobile,
        profilePicture: '',
        qrCode: '',
      );
      await _profileRepository.updatePersonalInfo(profile);
      await getUserProfileInfo();
      Get.back();
      AppDialogs.showSuccessDialog(context, 'Your profile has been updated successfully.');
    } catch (e) {
      log(e.toString());
    } finally {
      setLoading(false);
    }
  }

  /// Update User Profile Image Api Call
  Future<void> updateUserProfileImage(String image, BuildContext context) async {
    try {
      await _profileRepository.updateProfileImage(image);
      await getUserProfileInfo();
      //Get.back();
      AppDialogs.showSuccessDialog(context, 'Your profile has been updated successfully.');
    } catch (e) {
      log(e.toString());
    }
  }

  /// Update User Business Profile Api Call
  Future<void> updateUserBusinessInfo(BuildContext context) async {
    try {
      setLoading(true);
      BusinessInfo businessInfo = BusinessInfo(
        name: businessName,
        type: businessType,
        description: businessDescription,
        location: businessLocation,
        taxNumber: businessTaxNumber,
        id: 0,
        uid: '',
        isApproved: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        owner: 0,
      );
      await _profileRepository.updateBusinessInfo(businessInfo);
      await getUserBusinessInfo();
      Get.back();
      AppDialogs.showSuccessDialog(context, 'Your business details has been updated successfully.');
    } catch (e) {
      log(e.toString());
    } finally {
      setLoading(false);
    }
  }

  Future<void> logout() async {
    bool logout = await Preference.clear();
    if (logout) {
      Get.offAllNamed(WelcomeView.id);
    }
  }
}
