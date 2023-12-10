import 'package:mobikon/services/signup_service.dart';

class SignUpRepository extends SignUpService {
  final WCAuthService wcAuthService = WCAuthService();

  @override
  Future<bool> signUp(String email, String password) async {
    return await wcAuthService.signUp(email, password);
  }
}
