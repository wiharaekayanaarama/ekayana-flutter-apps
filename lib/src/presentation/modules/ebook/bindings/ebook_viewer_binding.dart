import 'package:ekayanaarama/ekayana.dart';
import 'package:get/get.dart';

class EbookViewerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<EbookViewerController>(
        EbookViewerController()
    );
  }
}