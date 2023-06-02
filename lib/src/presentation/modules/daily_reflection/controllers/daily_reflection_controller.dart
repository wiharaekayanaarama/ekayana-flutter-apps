import 'dart:convert';
import 'dart:io';

import 'package:ekayanaarama/ekayana.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

class DailyReflectionController extends GetxController {
  final DateTime dateNow = DateTime.now();
  final Map<int, String> _backgrounds = {
    1: "bg_blue.png",
    2: "bg_green.png",
    3: "bg_orange.png",
    4: "bg_purple.png",
    5: "bg_red.png",
  };

  late String background;
  late dynamic dailyReflectionJson;

  @override
  void onInit() {
    background =
        _backgrounds[dateNow.day % _backgrounds.length] ?? "bg_blue.png";
    dailyReflectionJson = readDailyReflectionJson();
    super.onInit();
  }

  Future<dynamic> readDailyReflectionJson() async {
    final month = dateNow.month;
    final day = dateNow.day;
    final String response = await rootBundle.loadString(
      'asset/json/daily_reflection/$month.json',
    );
    final data = await json.decode(response);
    return Future.value(data['$day']);
  }

  Future<File> fileFromUint8List(Uint8List? uint8list) async {
    final Directory appDir = await getTemporaryDirectory();
    File file = await File(
            '${appDir.path}/renungan-${dateNow.month}-${dateNow.day}.png')
        .create();
    file.writeAsBytesSync(uint8list ?? Uint8List(0));
    return file;
  }

  Future<void> saveToGallery(Uint8List? uint8list) async {
    final appDir = await getTemporaryDirectory();
    final file =
        File('${appDir.path}/renungan-${dateNow.month}-${dateNow.day}.png');
    await file.writeAsBytes(uint8list ?? Uint8List(0));

    final result = await ImageGallerySaver.saveImage(file.readAsBytesSync());
    if (result['isSuccess']) {
      Get.snackbar(
        "Berhasil unduh",
        "Renungan Harian",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: ColorToken.success_500,
        colorText: ColorToken.white,
        margin: const EdgeInsets.all(16),
      );
    } else {
      Get.snackbar(
        "Gagal unduh",
        "${result['errorMessage']}",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: ColorToken.error_500,
        colorText: ColorToken.white,
        margin: const EdgeInsets.all(16),
      );
    }
  }
}
