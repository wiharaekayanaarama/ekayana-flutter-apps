import 'package:ekayanaarama/src/data/providers/api_provider.dart';
import 'package:ekayanaarama/src/data/repositories/event_repository_impl.dart';
import 'package:ekayanaarama/src/presentation/modules/event/controller/previous_event_controller.dart';
import 'package:get/get.dart';

class PreviousEventsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ApiProvider>(
      ApiProvider(),
    );
    Get.put<EventRepositoryImpl>(
      EventRepositoryImpl(
        provider: Get.find(),
      ),
    );
    Get.put<PreviousEventsController>(
      PreviousEventsController(
        repository: Get.find(),
      ),
    );
  }
}