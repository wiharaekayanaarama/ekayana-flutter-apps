import 'package:ekayanaarama/src/data/entity/routine_activity_entity.dart';
import 'package:ekayanaarama/src/data/repositories/routine_activity_repository_impl.dart';
import 'package:get/get.dart';

class HomeActivityController extends GetxController
    with StateMixin<List<RoutineActivityEntity>> {
  final RoutineActivityRepositoryImpl repository;

  HomeActivityController({
    required this.repository,
  });

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.loading());
    getTodayActivities();
  }

  void getTodayActivities() async {
    await repository.getTodayActivities().then((value) {
      change(value, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error));
    });
  }
}