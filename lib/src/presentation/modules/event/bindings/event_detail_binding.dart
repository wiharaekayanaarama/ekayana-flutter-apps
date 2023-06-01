import 'package:ekayanaarama/src/data/providers/api_provider.dart';
import 'package:ekayanaarama/src/data/repositories/event_repository_impl.dart';
import 'package:ekayanaarama/src/presentation/modules/event/controller/event_detail_controller.dart';
import 'package:get/get.dart';

class EventDetailBinding extends Bindings {
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
    Get.put<EventDetailController>(
      EventDetailController(
        repository: Get.find(),
      ),
    );
  }
}