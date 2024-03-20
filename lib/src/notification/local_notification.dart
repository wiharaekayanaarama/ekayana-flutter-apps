import 'dart:async';

import 'package:ekayanaarama/src/notification/notification_handler.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotification {
  static bool isFlutterLocalNotificationsInitialized = false;
  static late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  static Future<void> setupFlutterLocalNotifications() async {
    if (isFlutterLocalNotificationsInitialized) {
      return;
    }

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings();

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );

    await instance.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) {
            localPushNotificationOnClickHandler(notificationResponse);
      },
    );

    isFlutterLocalNotificationsInitialized = true;
  }

  static FlutterLocalNotificationsPlugin get instance {
    if (!isFlutterLocalNotificationsInitialized) {
      flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
      isFlutterLocalNotificationsInitialized = true;
    }
    return flutterLocalNotificationsPlugin;
  }
}
