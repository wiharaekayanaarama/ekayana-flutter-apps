import 'package:ekayanaarama/src/data/entity/event_entity.dart';
import 'package:ekayanaarama/src/data/repositories/event_repository_impl.dart';
import 'package:get/get.dart';

class IncomingEventsController extends GetxController
    with StateMixin<List<EventEntity>> {
  final EventRepositoryImpl repository;

  IncomingEventsController({
    required this.repository,
  });

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.loading());
    getEvents();
  }

  void getEvents() async {
    await repository.getEvents().then((value) {
      change(value, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error));
    });
  }
}