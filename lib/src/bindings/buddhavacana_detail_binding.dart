import 'package:ekayanaarama/src/controller/buddhavacana_detail_controller.dart';
import 'package:get/get.dart';

class BuddhavacanaDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<BuddhavacanaDetailController>(
        BuddhavacanaDetailController()
    );
  }
}