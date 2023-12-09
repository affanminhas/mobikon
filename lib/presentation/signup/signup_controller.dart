
import 'package:get/get.dart';

class SignUpController extends GetxController {
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
}
