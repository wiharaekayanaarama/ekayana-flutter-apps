import 'package:package_info_plus/package_info_plus.dart';

class AppInfo {
  /// [appVersion] to get app version.
  /// Example: 2.0.0
  static late String appVersion;
  /// [buildNumber] to get build number.
  /// Example: 11
  static late String buildNumber;

  static Future<void> getPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion = packageInfo.version;
    buildNumber = packageInfo.buildNumber;
  }
}