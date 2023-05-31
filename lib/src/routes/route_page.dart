import 'package:ekayanaarama/src/presentation/modules/buddhavacana/bindings/buddhavacana_binding.dart';
import 'package:ekayanaarama/src/presentation/modules/buddhavacana/bindings/buddhavacana_detail_binding.dart';
import 'package:ekayanaarama/src/presentation/modules/buddhavacana/pages/buddhavacana_page.dart';
import 'package:ekayanaarama/src/presentation/modules/daily_reflection/bindings/daily_reflection_binding.dart';
import 'package:ekayanaarama/src/presentation/modules/ebook/bindings/ebook_viewer_binding.dart';
import 'package:ekayanaarama/src/presentation/modules/about/bindings/about_detail_binding.dart';
import 'package:ekayanaarama/src/presentation/modules/about/pages/about_detail_page.dart';
import 'package:ekayanaarama/src/presentation/modules/about/pages/about_ekayana_page.dart';
import 'package:ekayanaarama/src/presentation/modules/about/pages/dana_information_page.dart';
import 'package:ekayanaarama/src/presentation/modules/buddhavacana/pages/buddhavacana_detail_page.dart';
import 'package:ekayanaarama/src/presentation/modules/daily_reflection/pages/daily_reflection_page.dart';
import 'package:ekayanaarama/src/presentation/modules/ebook/bindings/ebooks_binding.dart';
import 'package:ekayanaarama/src/presentation/modules/ebook/pages/ebook_viewer_page.dart';
import 'package:ekayanaarama/src/presentation/modules/ebook/pages/ebooks_page.dart';
import 'package:ekayanaarama/src/presentation/modules/event/bindings/incoming_events_binding.dart';
import 'package:ekayanaarama/src/presentation/modules/event/bindings/previous_events_binding.dart';
import 'package:ekayanaarama/src/presentation/modules/event/controller/previous_event_controller.dart';
import 'package:ekayanaarama/src/presentation/modules/event/pages/event_detail_page.dart';
import 'package:ekayanaarama/src/presentation/modules/event/pages/event_page.dart';
import 'package:ekayanaarama/src/routes/route_name.dart';
import 'package:get/get.dart';

class RoutePage {
  static final pages = [
    GetPage(
      name: RouteName.event,
      page: () => const EventPage(),
      bindings: [
        IncomingEventsBinding(),
        PreviousEventsBinding(),
      ],
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
      page: () => const DailyReflectionPage(),
      binding: DailyReflectionBinding(),
    ),
    GetPage(
      name: RouteName.aboutEkayana,
      page: () => const AboutEkayanaPage(),
    ),
    GetPage(
      name: RouteName.aboutDetailEkayana,
      page: () => const AboutDetailPage(),
      binding: AboutDetailBinding(),
    ),
    GetPage(
      name: RouteName.danaInformation,
      page: () => const DanaInformationPage(),
    ),
    GetPage(
      name: RouteName.ebooks,
      page: () => const EbooksPage(),
      binding: EbookBinding(),
    ),
    GetPage(
      name: RouteName.ebookViewer,
      page: () => const EbookViewerPage(),
      binding: EbookViewerBinding(),
    ),
  ];
}
