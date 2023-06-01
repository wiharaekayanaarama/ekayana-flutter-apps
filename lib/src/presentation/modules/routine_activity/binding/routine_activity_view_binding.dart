import 'package:ekayanaarama/src/data/providers/api_provider.dart';
import 'package:ekayanaarama/src/data/repositories/routine_activity_repository_impl.dart';
import 'package:ekayanaarama/src/presentation/modules/routine_activity/controller/routine_activity_view_controller.dart';
import 'package:get/get.dart';

class RoutineActivityViewBinding extends Bindings {
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
    Get.put<RoutineActivityViewController>(
      RoutineActivityViewController(
        repository: Get.find(),
      ),
    );
  }
}