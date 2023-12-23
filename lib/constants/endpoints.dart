class Endpoints {
  static const String baseUrl = "https://mobikon.pythonanywhere.com";

  /// Get Started Endpoints
  static const String getStartedURL = "$baseUrl/api/accounts/getstarted";

  /// Warehouse Endpoints
  static const String warehouseURL = "$baseUrl/api/warehouse/container-sizes";

  /// Login Endpoints
  static const String loginURL = "$baseUrl/api/accounts/login";

  /// Reset Password Endpoints
  static const String resetPasswordURL = "$baseUrl/api/accounts/password-reset";

  /// Signup Endpoints
  static const String signupURL = "$baseUrl/api/accounts/register";
  static const String sendEmailCodeURL = "$baseUrl/api/accounts/verify/email";
  static const String verifyCodeURL = "$baseUrl/api/accounts/verify/email";

  /// Business Endpoints
  static const String businessURL = "$baseUrl/api/businesses/register";
}
