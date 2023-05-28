import 'package:ekayanaarama/ekayana.dart';
import 'package:get/get.dart';

class BuddhavacanaDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<BuddhavacanaDetailController>(
        BuddhavacanaDetailController()
    );
  }
}