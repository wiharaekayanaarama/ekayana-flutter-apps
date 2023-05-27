import 'package:ekayanaarama/src/controller/about_detail_controller.dart';
import 'package:get/get.dart';

class AboutDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AboutDetailController>(
        AboutDetailController()
    );
  }
}