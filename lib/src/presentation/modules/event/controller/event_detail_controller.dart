import 'package:ekayanaarama/src/data/entity/event_entity.dart';
import 'package:ekayanaarama/src/data/repositories/event_repository_impl.dart';
import 'package:get/get.dart';

class EventDetailController extends GetxController
    with StateMixin<EventEntity> {
  int id = Get.arguments['id'];
  final EventRepositoryImpl repository;

  EventDetailController({
    required this.repository,
  });

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.loading());
    getEventDetail();
  }

  void getEventDetail() async {
    await repository.getEventById(id).then((value) {
      change(value, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error));
    });
  }
}
