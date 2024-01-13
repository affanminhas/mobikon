import 'package:mobikon/presentation/my_account/model/business_model.dart';
import 'package:mobikon/presentation/my_account/model/profile_model.dart';
import 'package:mobikon/services/profile_service.dart';

class ProfileRepository extends ProfileService {
  final WCProfileService wcProfileService = WCProfileService();

  @override
  Future<UserProfile> getPersonalInfo() async {
    try {
      return await wcProfileService.getPersonalInfo();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> updatePersonalInfo(UserProfile profile) async {
    try {
      return await wcProfileService.updatePersonalInfo(profile);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BusinessInfo> getBusinessInfo() async {
    try {
      return await wcProfileService.getBusinessInfo();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> updateBusinessInfo(BusinessInfo business) async {
    try {
      return await wcProfileService.updateBusinessInfo(business);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> updateProfileImage(String profileImage) async{
    try {
      return await wcProfileService.updateProfileImage(profileImage);
    } catch (e) {
      rethrow;
    }
  }
}
