import 'package:ekayanaarama/src/data/entity/routine_activity_entity.dart';
import 'package:ekayanaarama/src/data/repositories/routine_activity_repository_impl.dart';
import 'package:get/get.dart';

class RoutineActivityController extends GetxController
    with StateMixin<List<RoutineActivityEntity>> {
  final RoutineActivityRepositoryImpl repository;

  RoutineActivityController({
    required this.repository,
  });

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.loading());
    getRoutineActivities();
  }

  void getRoutineActivities() async {
    await repository.getRoutineActivities().then((value) {
      change(value, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error));
    });
  }
}
