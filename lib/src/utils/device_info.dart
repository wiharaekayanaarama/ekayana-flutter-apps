import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';

class DeviceInfo {
  /// [model] to get model device.
  /// Example: Pixel 7 Pro
  static late String model;
  /// [deviceId] to get device id.
  /// Example: TQ2A.230505.002
  static late String deviceId;
  /// [os] to get os version. For android using sdk version
  /// Example: 13
  static late String os;

  static Future<void> getDeviceInfo() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        final AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin.androidInfo;

        model = androidDeviceInfo.model;
        deviceId = androidDeviceInfo.id;
        os = androidDeviceInfo.version.sdkInt.toString();
      } else if (Platform.isIOS) {
        final IosDeviceInfo iosDeviceInfo = await deviceInfoPlugin.iosInfo;

        model = iosDeviceInfo.model;
        deviceId = iosDeviceInfo.identifierForVendor ?? "";
        os = iosDeviceInfo.systemVersion;
      } else {
        throw Exception("Unsupported platform");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching device info: $e");
      }
    }
  }
}