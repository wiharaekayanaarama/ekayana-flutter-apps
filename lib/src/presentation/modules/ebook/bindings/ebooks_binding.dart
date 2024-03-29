import 'package:ekayanaarama/src/data/providers/api_provider.dart';
import 'package:ekayanaarama/src/data/repositories/ebook_repository_impl.dart';
import 'package:ekayanaarama/src/presentation/modules/ebook/controllers/ebooks_controller.dart';
import 'package:get/get.dart';

class EbookBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ApiProvider>(
      ApiProvider(),
    );
    Get.put<EbookRepositoryImpl>(
      EbookRepositoryImpl(
        provider: Get.find(),
      ),
    );
    Get.put<EbooksController>(
      EbooksController(
        repository: Get.find(),
      ),
    );
  }
}
