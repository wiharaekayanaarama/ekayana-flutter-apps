import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:ekayanaarama/src/data/entity/event_entity.dart';
import 'package:ekayanaarama/src/data/repositories/event_repository_impl.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class EventDetailController extends GetxController
    with StateMixin<EventEntity> {
  int id = Get.arguments['id'];
  final EventRepositoryImpl repository;

  EventDetailController({
    required this.repository,
  });

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.loading());
    getEventDetail();
  }

  void getEventDetail() async {
    await repository.getEventById(id).then((value) {
      change(value, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error));
    });
  }

  Future<File> urlToFile(String url) async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    File file = File("$tempPath.png");
    http.Response response = await http.get(Uri.parse(url));
    await file.writeAsBytes(response.bodyBytes);
    return file;
  }
}
