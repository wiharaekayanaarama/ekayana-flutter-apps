import 'dart:io';

import 'package:ekayanaarama/src/utils/app_info.dart';
import 'package:ekayanaarama/src/utils/device_info.dart';
import 'package:get/get_connect/connect.dart';

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'https://api.ekayana.or.id/gateway';
    httpClient.timeout = const Duration(minutes: 1);
    httpClient.addAuthenticator<dynamic>((request) async {
      request.headers.addAll(getHeaders());
      return request;
    });

    super.onInit();
  }

  Map<String, String> getHeaders() {
    final platform = Platform.isAndroid ? "ANDROID" : "IOS";
    return {
      "User-Agent": "Ekayana-$platform-Version",
      "Accept": "application/json",
      "Eka-Version": AppInfo.appVersion,
      "Eka-Platform": platform,
      "Eka-Device-ID": DeviceInfo.deviceId,
      "Eka-Device-Model": DeviceInfo.model,
      "Eka-Device-OS": DeviceInfo.os,
    };
  }
}