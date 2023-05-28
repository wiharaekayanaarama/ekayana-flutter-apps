import 'package:ekayanaarama/ekayana.dart';
import 'package:get/get.dart';

class BuddhavacanaBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<BuddhavacanaController>(
      BuddhavacanaController()
    );
  }
}