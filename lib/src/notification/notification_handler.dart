import 'dart:convert';
import 'package:ekayanaarama/src/notification/local_notification.dart';
import 'package:ekayanaarama/src/routes/route_name.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

void checkPushNotification() async {
  final notifDetail =
      await LocalNotification.instance.getNotificationAppLaunchDetails();
  if (notifDetail != null) {
    if (notifDetail.didNotificationLaunchApp) {
      localPushNotificationOnClickHandler(notifDetail.notificationResponse);
    }
  }

  var remoteMessage = await FirebaseMessaging.instance.getInitialMessage();
  firebaseMessagingOnClickHandler(remoteMessage);
}

Future<void> firebaseMessagingOnClickHandler(RemoteMessage? message) async {
  if (message == null) return;
  _handleNotification(message.data);
}

Future<void> localPushNotificationOnClickHandler(
    NotificationResponse? response) async {
  if (response == null) return;

  if (response.id == 0) {
    Get.toNamed(RouteName.dailyReflection);
  } else {
    Map<String, dynamic> data =
        response.payload != null ? await jsonDecode(response.payload!) : {};
    _handleNotification(data);
  }
}

void _handleNotification(Map<String, dynamic> data) {
  Get.toNamed(RouteName.buddavacana);
}
