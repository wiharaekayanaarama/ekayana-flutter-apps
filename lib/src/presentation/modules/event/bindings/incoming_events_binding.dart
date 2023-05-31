import 'package:ekayanaarama/src/data/providers/api_provider.dart';
import 'package:ekayanaarama/src/data/repositories/event_repository_impl.dart';
import 'package:ekayanaarama/src/presentation/modules/event/controller/incoming_events_controller.dart';
import 'package:get/get.dart';

class IncomingEventsBinding extends Bindings {
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
    Get.put<IncomingEventsController>(
      IncomingEventsController(
        repository: Get.find(),
      ),
    );
  }
}