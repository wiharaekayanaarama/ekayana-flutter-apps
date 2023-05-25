import 'package:ekayanaarama/src/controller/buddhavacana_controller.dart';
import 'package:get/get.dart';

class BuddhavacanaBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<BuddhavacanaController>(
      BuddhavacanaController()
    );
  }
}