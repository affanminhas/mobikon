import 'package:mobikon/services/login_service.dart';

class LoginRepository extends LoginService {
  final WCAuthService wcAuthService = WCAuthService();

  @override
  Future<bool> login(String email, String password) async {
    return await wcAuthService.login(email, password);
  }

  @override
  Future<Map<String, dynamic>> getStarted() async {
    try {
      return await wcAuthService.getStarted();
    } catch (e) {
      rethrow;
    }
  }
}
