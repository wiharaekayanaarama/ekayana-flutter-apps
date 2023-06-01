import 'package:ekayanaarama/src/data/providers/api_provider.dart';
import 'package:ekayanaarama/src/data/repositories/routine_activity_repository_impl.dart';
import 'package:ekayanaarama/src/presentation/modules/home/controllers/home_activity_controller.dart';
import 'package:get/get.dart';

class HomeActivityBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ApiProvider>(
      ApiProvider(),
    );
    Get.put<RoutineActivityRepositoryImpl>(
      RoutineActivityRepositoryImpl(
        provider: Get.find(),
      ),
    );
    Get.put<HomeActivityController>(
      HomeActivityController(
        repository: Get.find(),
      ),
    );
  }
}