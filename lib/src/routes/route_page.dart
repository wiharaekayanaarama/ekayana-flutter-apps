import 'package:ekayanaarama/src/bindings/buddhavacana_binding.dart';
import 'package:ekayanaarama/src/bindings/buddhavacana_detail_binding.dart';
import 'package:ekayanaarama/src/page/buddhavacana/buddhavacana_detail_page.dart';
import 'package:ekayanaarama/src/page/buddhavacana/buddhavacana_page.dart';
import 'package:ekayanaarama/src/page/daily_reflection/daily_reflection.dart';
import 'package:ekayanaarama/src/page/event/event_detail_page.dart';
import 'package:ekayanaarama/src/page/event/event_page.dart';
import 'package:ekayanaarama/src/routes/route_name.dart';
import 'package:get/get.dart';

class RoutePage {
  static final pages = [
    GetPage(
      name: RouteName.event,
      page: () => const EventPage(),
    ),
    GetPage(
      name: RouteName.eventDetail,
      page: () => const EventDetailPage(),
    ),
    GetPage(
      name: RouteName.buddavacana,
      page: () => const BuddhavacanaPage(),
      binding: BuddhavacanaBinding(),
    ),
    GetPage(
      name: RouteName.buddavacanaDetail,
      page: () => const BuddhavacanaDetailPage(),
      binding: BuddhavacanaDetailBinding(),
    ),
    GetPage(
      name: RouteName.dailyReflection,
      page: () => const DailyReflection(),
    ),
  ];
}
