import 'package:ekayanaarama/src/controller/daily_reflection_controller.dart';
import 'package:get/get.dart';

class DailyReflectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DailyReflectionController>(
        DailyReflectionController()
    );
  }
}