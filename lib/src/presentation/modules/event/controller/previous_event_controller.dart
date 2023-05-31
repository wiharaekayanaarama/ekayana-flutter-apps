import 'package:ekayanaarama/src/data/entity/event_entity.dart';
import 'package:ekayanaarama/src/data/repositories/event_repository_impl.dart';
import 'package:get/get.dart';

class PreviousEventsController extends GetxController with StateMixin<List<EventEntity>> {
  final EventRepositoryImpl repository;

  PreviousEventsController({
    required this.repository,
  });

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.loading());
    getPastEvents();
  }

  void getPastEvents() async {
    await repository.getPastEvents().then((value) {
      change(value, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error));
    });
  }
}