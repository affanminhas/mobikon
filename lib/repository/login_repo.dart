import 'package:mobikon/domain/get_started_model.dart';
import 'package:mobikon/services/login_service.dart';

class LoginRepository extends LoginService {
  final WCAuthService wcAuthService = WCAuthService();

  @override
  Future<bool> login(String email, String password) async {
    return await wcAuthService.login(email, password);
  }

  @override
  Future<GetStartedModel> getStarted() async {
    try {
      return await wcAuthService.getStarted();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> loginRefresh() async {
    try {
      return await wcAuthService.loginRefresh();
    } catch (e) {
      rethrow;
    }
  }
}
