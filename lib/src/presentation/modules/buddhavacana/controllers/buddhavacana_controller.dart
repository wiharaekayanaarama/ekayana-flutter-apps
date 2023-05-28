import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BuddhavacanaController extends GetxController {
  late dynamic buddhavacanaJson;
  RxInt currentPage = 0.obs;

  Future<dynamic> readJson() async {
    final String response = await rootBundle.loadString('asset/json/buddhavacana.json');
    final data = await json.decode(response);
    return Future.value(data);
  }

  @override
  void onInit() {
    buddhavacanaJson = readJson();
    super.onInit();
  }
}