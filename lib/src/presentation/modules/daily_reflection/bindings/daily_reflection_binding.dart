import 'package:ekayanaarama/ekayana.dart';
import 'package:get/get.dart';

class DailyReflectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DailyReflectionController>(
        DailyReflectionController()
    );
  }
}