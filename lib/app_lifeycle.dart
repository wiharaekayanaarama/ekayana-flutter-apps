import 'package:ekayanaarama/src/notification/notification_handler.dart';
import 'package:ekayanaarama/src/routes/route_name.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as tz;

void onCreate() async {
  final isHandled = await isPushNotificationHandled();
  if (!isHandled) {
    final sharedPref = Get.find<SharedPreferences>();
    final lastDailyDate = sharedPref.getString("last_daily");
    final today = tz.TZDateTime.now(tz.local);
    final todayString = DateFormat("yyyy-MM-dd").format(today);
    if (lastDailyDate != todayString) {
      sharedPref.setString("last_daily", todayString);
      Get.toNamed(RouteName.dailyReflection);
    }
  }
}
