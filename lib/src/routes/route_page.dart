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
    )
  ];
}