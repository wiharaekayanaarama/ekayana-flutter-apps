import 'dart:io';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class LoggerUtils {
  LoggerUtils._();
  
  static void logHTTPError(String? message) async {
    await FirebaseCrashlytics.instance.recordError(HttpException(message ?? ""), null);
  }
}