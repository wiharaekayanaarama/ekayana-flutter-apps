import 'package:get/get.dart';

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'http://api.ekayana.or.id/gateway';
    httpClient.timeout = const Duration(minutes: 1);
  }
}