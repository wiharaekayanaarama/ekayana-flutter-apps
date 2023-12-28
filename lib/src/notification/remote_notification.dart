import 'package:ekayanaarama/src/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'local_notification.dart';
import 'notification_handler.dart';

bool isFlutterLocalNotificationsInitialized = false;

Future<void> initializeRemoteNotification() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // when app is in pause state i.e. app is active in background,
  // a notification will be appeared in notification tray and on click of that notification onMessageOpenedApp
  // callback will be called which is also a Stream<RemoteMessage> so you can handle it like
  FirebaseMessaging.onMessageOpenedApp.listen(firebaseMessagingOnClickHandler);

  subscribeEkayanaTopic();
  LocalNotification.instance;
}

Future<void> _setupLocalWithRemote() async {
  if (isFlutterLocalNotificationsInitialized) return;
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'ekayana_channel', // id
    'Ekayana', // title
    importance: Importance.max,
  );
  await LocalNotification.instance
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  isFlutterLocalNotificationsInitialized = true;
}

void subscribeEkayanaTopic() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  if (kDebugMode) {
    await messaging.subscribeToTopic("testekayana");
  } else {
    await messaging.subscribeToTopic("ekayana");
  }
}

Future<String?> getFCMToken() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  return messaging.getToken();
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  LocalNotification.instance;
  _setupLocalWithRemote();
}
