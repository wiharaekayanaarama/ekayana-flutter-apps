import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'local_notification.dart';

Future<void> _configureLocalTimeZone() async {
  if (kIsWeb || Platform.isLinux) {
    return;
  }
  tz.initializeTimeZones();
  final String timeZoneName = await FlutterTimezone.getLocalTimezone();
  tz.setLocalLocation(tz.getLocation(timeZoneName));
}

tz.TZDateTime _nextInstanceOfTenAM() {
  tz.TZDateTime now = tz.TZDateTime.now(tz.local);
  tz.TZDateTime scheduledDate =
      tz.TZDateTime(tz.local, now.year, now.month, now.day, 10);
  if (scheduledDate.isBefore(now)) {
    scheduledDate = scheduledDate.add(const Duration(days: 1));
  }
  return scheduledDate;
}

Future<void> setupDailyReflectionReminder() async {
  await _configureLocalTimeZone();
}

void setScheduleNotification() async {
  await LocalNotification.instance.zonedSchedule(
    0,
    'Ekayana Arama Indonesia Buddhist Center',
    'Renungan Hari Ini',
    _nextInstanceOfTenAM(),
    const NotificationDetails(
      android: AndroidNotificationDetails(
        'daily_reflection_id',
        'daily_reflection_name',
        channelDescription: 'daily notification description',
      ),
    ),
    androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
    matchDateTimeComponents: DateTimeComponents.time,
  );
}
