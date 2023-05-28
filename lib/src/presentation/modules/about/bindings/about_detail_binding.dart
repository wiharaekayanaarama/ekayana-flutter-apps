import 'package:ekayanaarama/ekayana.dart';
import 'package:get/get.dart';

class AboutDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AboutDetailController>(
        AboutDetailController()
    );
  }
}