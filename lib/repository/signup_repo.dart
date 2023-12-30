import 'package:mobikon/domain/container_size_model.dart';
import 'package:mobikon/services/signup_service.dart';

class SignUpRepository extends SignUpService {
  final WCAuthService wcAuthService = WCAuthService();

  @override
  Future<bool> signUp(
    String firstName,
    String lastName,
    String email,
    String password,
    String phoneNumber,
  ) async {
    return await wcAuthService.signUp(firstName, lastName, email, password, phoneNumber);
  }

  @override
  Future<bool> registerBusiness(
    String businessName,
    String businessType,
    String businessLocation,
    String taxNumber,
    int containerSize,
    bool hasCamera,
    bool hasShelves,
  ) async {
    try {
      return await wcAuthService.registerBusiness(
        businessName,
        businessType,
        businessLocation,
        taxNumber,
        containerSize,
        hasCamera,
        hasShelves,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ContainerSize>> getContainerSize() async {
    try {
      return await wcAuthService.getContainerSize();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> sendEmailVerification(String email) {
    // TODO: implement sendEmailVerification
    throw UnimplementedError();
  }

  @override
  Future<bool> verifyCode(String email, String code) {
    // TODO: implement verifyCode
    throw UnimplementedError();
  }
}
