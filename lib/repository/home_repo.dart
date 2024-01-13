import 'package:mobikon/domain/container_size_model.dart';
import 'package:mobikon/presentation/home/model/container_model.dart';
import 'package:mobikon/services/home_service.dart';

class HomeRepository extends HomeService {
  final WCDashboardService wcAuthService = WCDashboardService();

  @override
  Future<List<ContainerSize>> getContainerSize() async {
    try {
      return await wcAuthService.getContainerSize();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<UserContainer>> getAllContainers() async {
    try {
      return await wcAuthService.getAllContainers();
    } catch (e) {
      rethrow;
    }
  }
}
