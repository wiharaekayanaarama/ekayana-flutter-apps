import 'package:ekayanaarama/src/firebase_options.dart';
import 'package:ekayanaarama/src/notification/daily_reflection_reminder.dart';
import 'package:ekayanaarama/src/notification/local_notification.dart';
import 'package:ekayanaarama/src/notification/notification_handler.dart';
import 'package:ekayanaarama/src/routes/route_name.dart';
import 'package:ekayanaarama/src/routes/route_page.dart';
import 'package:ekayanaarama/src/utils/app_info.dart';
import 'package:ekayanaarama/src/utils/device_info.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:firebase_core/firebase_core.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FlutterDownloader.initialize(debug: kDebugMode, ignoreSsl: false);

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  await LocalNotification.setupFlutterLocalNotifications();
  await setupDailyReflectionReminder();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();

  await DeviceInfo.getDeviceInfo();
  await AppInfo.getPackageInfo();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('id_ID', null);
    setScheduleNotification();

    return GetMaterialApp(
      initialRoute: RouteName.home,
      getPages: RoutePage.pages,
      title: 'Ekayana',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Inter",
      ),
      onInit: () {
        checkPushNotification();
      },
    );
  }
}
