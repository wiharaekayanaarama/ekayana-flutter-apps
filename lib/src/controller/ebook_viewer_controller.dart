import 'dart:async';

import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:get/get.dart';

class EbookViewerController extends GetxController {
  String title = Get.arguments['title'];
  String pdfUrl = Get.arguments['pdfUrl'];
  final RxInt currentPage = 0.obs;
  final RxInt totalPage = 0.obs;
  final Completer<PDFViewController> pdfViewController = Completer<PDFViewController>();

}