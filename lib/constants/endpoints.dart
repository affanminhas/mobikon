class Endpoints {
  static const String baseUrl = "https://mobikon.pythonanywhere.com";

  /// Get Started Endpoints
  static const String getStartedURL = "$baseUrl/api/accounts/getstarted";

  /// Warehouse Endpoints
  static const String warehouseURL = "$baseUrl/api/warehouse/container-sizes";
  static const String getAllContainers = "$baseUrl/api/warehouse/containers";

  /// Login Endpoints
  static const String loginURL = "$baseUrl/api/accounts/login";
  static const String loginRefresh = "$baseUrl/api/accounts/login/refresh";

  /// Reset Password Endpoints
  static const String resetPasswordURL = "$baseUrl/api/accounts/password-reset";

  /// Signup Endpoints
  static const String signupURL = "$baseUrl/api/accounts/register";
  static const String sendEmailCodeURL = "$baseUrl/api/accounts/verify/email";
  static const String verifyCodeURL = "$baseUrl/api/accounts/verify/email";

  /// Business Endpoints
  static const String businessURL = "$baseUrl/api/businesses/register";

  /// Profile Endpoints
  static const String getProfileInfo = "$baseUrl/api/accounts/profile/personal";
  static const String updateProfileInfo = "$baseUrl/api/accounts/profile/personal";
  static const String getBusinessInfo = "$baseUrl/api/accounts/profile/business";
  static const String updateBusinessInfo = "$baseUrl/api/accounts/profile/business";

  /// Product Endpoints
  static const String productAPI = "$baseUrl/api/stock/products/";

  /// Stock Endpoints
  static const String stockHistoryURL = "$baseUrl/api/stock/history/";
  static const String shelvesURL = "$baseUrl/api/warehouse/shelves";
}
