import 'package:ekayanaarama/src/data/entity/ebook_entity.dart';
import 'package:ekayanaarama/src/data/repositories/ebook_repository_impl.dart';
import 'package:get/get.dart';

class EbooksController extends GetxController with StateMixin<List<EbookEntity>> {
  final EbookRepositoryImpl repository;

  EbooksController({
    required this.repository,
  });

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.loading());
    getEbooks();
  }

  void getEbooks() async {
    await repository.getEbooks().then((value) {
      change(value, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error));
    });
  }

  void incrementView(int id ) async {
    await repository.incrementEbookView(id).catchError((onError) {
      return true;
    });
  }
}