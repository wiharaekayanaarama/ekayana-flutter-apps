import 'package:ekayanaarama/src/page/event_page.dart';
import 'package:ekayanaarama/src/routes/route_name.dart';
import 'package:get/get.dart';

class RoutePage {
  static final pages = [
    GetPage(
      name: RouteName.event,
      page: () => const EventPage(),
    ),
  ];
}