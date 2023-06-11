import 'package:ekayanaarama/src/utils/device_info.dart';
import 'package:get/get_connect/connect.dart';

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'http://api.ekayana.or.id/gateway';
    httpClient.timeout = const Duration(minutes: 1);
    // httpClient.addAuthenticator<dynamic>((request) async {
    //   request.headers.addAll(getHeaders());
    //   return request;
    // });

    super.onInit();
  }

  Map<String, String> getHeaders() {
    return {
      "User-Agent": "",
      "Accept": "application/json",
      "Eka-Version": "",
      "Eka-Platform": "",
      "Eka-Device-ID": DeviceInfo.deviceId,
      "Eka-Device-Model": DeviceInfo.model,
      "Eka-Device-OS": DeviceInfo.os,
    };
  }
}