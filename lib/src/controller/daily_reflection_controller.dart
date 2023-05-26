import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DailyReflectionController extends GetxController {
  final DateTime dateNow = DateTime.now();
  final Map<int, String> _backgrounds = {
    1 : "bg_blue.png",
    2 : "bg_green.png",
    3 : "bg_orange.png",
    4 : "bg_purple.png",
    5 : "bg_red.png",
  };

  late String background;
  late dynamic dailyReflectionJson;

  @override
  void onInit() {
    background = _backgrounds[dateNow.day % _backgrounds.length] ?? "bg_blue.png";
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
}
