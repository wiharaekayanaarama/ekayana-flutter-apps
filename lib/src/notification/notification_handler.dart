import 'dart:convert';
import 'package:ekayanaarama/src/notification/local_notification.dart';
import 'package:ekayanaarama/src/routes/route_name.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

Future<bool> isPushNotificationHandled() async {
  final notifDetail =
      await LocalNotification.instance.getNotificationAppLaunchDetails();
  if (notifDetail != null) {
    if (notifDetail.didNotificationLaunchApp) {
      if (await localPushNotificationOnClickHandler(notifDetail.notificationResponse)) return true;
    }
  }

  var remoteMessage = await FirebaseMessaging.instance.getInitialMessage();
  return firebaseMessagingOnClickHandler(remoteMessage);
}

Future<bool> firebaseMessagingOnClickHandler(RemoteMessage? message) async {
  if (message == null) return false;
  return _handleNotification(message.data);
}

Future<bool> localPushNotificationOnClickHandler(
    NotificationResponse? response) async {
  if (response == null) return false;

  if (response.id == 0) {
    Get.toNamed(RouteName.dailyReflection);
    return true;
  } else {
    Map<String, dynamic> data =
        response.payload != null ? await jsonDecode(response.payload!) : {};
    return _handleNotification(data);
  }
}

bool _handleNotification(Map<String, dynamic> data) {
  final url = data["url"] as String;
  if (!(url.isBlank ?? false)) {
    final uri = Uri.parse(url);
    print(uri.path);
    Get.toNamed(uri.path);
  }
  return true;
}
