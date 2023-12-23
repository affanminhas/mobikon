class Validator {
  static String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter your name';
    }
    return null;
  }

  // static String? nameValidator(String? value) {
  //   final name = RegExp(r'^[a-zA-Z\s]+$');
  //   if (value == null || value.isEmpty) {
  //     return Strings.enterYourName;
  //   } else if (value.length <= 3) {
  //     return Strings.enterYourName;
  //   } else if (value.length > 25) {
  //     return Strings.enterYourName;
  //   } else if (!name.hasMatch(value)) {
  //     return Strings.enterYourName;
  //   }
  //   return null;
  // }

  static String? formValidate(String? value, String message) {
    if (value == null || value.isEmpty) {
      return message;
    }
    return null;
  }

  static String? formApiValidate(String? value, String message, String apiErrorMessage) {
    if (value == null || value.isEmpty) {
      return message;
    } else if (apiErrorMessage.isNotEmpty) {
      return apiErrorMessage;
    }
    return null;
  }

  static String? validateOnly(String? value) {
    if (value == null || value.isEmpty) {
      return '';
    }
    return null;
  }

  static String? phoneNumberFullValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    } else if (value.length != 13) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  static String? phoneNumberValidator(String? value) {
    if (value!.isNotEmpty && value.length != 13) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  static String? emailValidator(String? value) {
    RegExp emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? emailApiValidator(String? value, String apiErrorMessage) {
    RegExp emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    } else if (apiErrorMessage.isNotEmpty) {
      return apiErrorMessage;
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  static String? passwordApiValidator(String? value, String apiErrorMessage) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    } else if (apiErrorMessage.isNotEmpty) {
      return apiErrorMessage;
    }
    return null;
  }

  static String? confirmPasswordValidator(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    } else if (value != password) {
      return 'Password does not match';
    }
    return null;
  }
}
