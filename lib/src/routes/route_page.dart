import 'package:ekayanaarama/src/bindings/about_detail_binding.dart';
import 'package:ekayanaarama/src/bindings/buddhavacana_binding.dart';
import 'package:ekayanaarama/src/bindings/buddhavacana_detail_binding.dart';
import 'package:ekayanaarama/src/bindings/daily_reflection_binding.dart';
import 'package:ekayanaarama/src/bindings/ebook_viewer_binding.dart';
import 'package:ekayanaarama/src/page/about/about_detail_page.dart';
import 'package:ekayanaarama/src/page/about/about_ekayana_page.dart';
import 'package:ekayanaarama/src/page/about/dana_information_page.dart';
import 'package:ekayanaarama/src/page/buddhavacana/buddhavacana_detail_page.dart';
import 'package:ekayanaarama/src/page/buddhavacana/buddhavacana_page.dart';
import 'package:ekayanaarama/src/page/daily_reflection/daily_reflection_page.dart';
import 'package:ekayanaarama/src/page/ebook/ebook_viewer_page.dart';
import 'package:ekayanaarama/src/page/ebook/ebooks_page.dart';
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
    ),
    GetPage(
      name: RouteName.ebookViewer,
      page: () => const EbookViewerPage(),
      binding: EbookViewerBinding(),
    ),
  ];
}
