import 'package:ekayanaarama/src/data/entity/routine_activity_entity.dart';
import 'package:ekayanaarama/src/data/repositories/routine_activity_repository_impl.dart';
import 'package:get/get.dart';

class RoutineActivityViewController extends GetxController
    with StateMixin<List<RoutineActivityEntity>> {
  final RoutineActivityRepositoryImpl repository;

  final selectedCategory = "semua".obs;

  final categories = [
    "semua",
    "kebaktian",
    "edukasi",
    "meditasi",
    "olahraga",
    "lainnya",
  ];

  RxList<RoutineActivityEntity>? entities = RxList();

  RoutineActivityViewController({
    required this.repository,
  });

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.loading());
    getRoutineActivities();
  }

  void filterActivities(String selectedCategory) {
    this.selectedCategory.value = selectedCategory;
    if (selectedCategory == "semua") {
      change(entities, status: RxStatus.success());
      return;
    }
    final filteredArray = entities?.where((element) {
      return element.category == selectedCategory;
    }).toList();
    change(filteredArray, status: RxStatus.success());
  }

  void getRoutineActivities() async {
    await repository.getRoutineActivities().then((value) {
      List<RoutineActivityEntity>? distinctArray = value?.fold<List<RoutineActivityEntity>>([], (list, entity) {
        if (!list.any((e) => e.id == entity.id)) {
          list.add(entity);
        }
        return list;
      });
      entities?.value = distinctArray ?? [];
      change(distinctArray, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error));
    });
  }
}
