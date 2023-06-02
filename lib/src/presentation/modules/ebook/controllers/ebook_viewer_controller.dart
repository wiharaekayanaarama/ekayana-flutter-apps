import 'dart:async';
import 'dart:ui';

import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';

class EbookViewerController extends GetxController {
  String title = Get.arguments['title'];
  String pdfUrl = Get.arguments['pdfUrl'];
  final RxInt currentPage = 0.obs;
  final RxInt totalPage = 0.obs;
  final Completer<PDFViewController> pdfViewController = Completer<PDFViewController>();

  @override
  void onInit() {
    super.onInit();
    FlutterDownloader.registerCallback(downloadCallback, step: 1);
  }

  @pragma('vm:entry-point')
  static void downloadCallback(
      String id,
      int status,
      int progress,
      ) {
    print(
      'Callback on background isolate: '
          'task ($id) is in status ($status) and process ($progress)',
    );

    IsolateNameServer.lookupPortByName('downloader_send_port')
        ?.send([id, status, progress]);
  }
}