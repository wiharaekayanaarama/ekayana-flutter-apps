import 'package:ekayanaarama/src/controller/ebook_viewer_controller.dart';
import 'package:get/get.dart';

class EbookViewerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<EbookViewerController>(
        EbookViewerController()
    );
  }
}