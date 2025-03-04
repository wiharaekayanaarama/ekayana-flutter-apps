import 'dart:io';

import 'package:ekayanaarama/ekayana.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class DailyReflectionPage extends GetView<DailyReflectionController> {
  const DailyReflectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenshotController screenshotController = ScreenshotController();

    return FutureBuilder(
      future: controller.dailyReflectionJson,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (!snapshot.hasData) return const SizedBox.shrink();

        final Map<String, dynamic> json = snapshot.data;
        final List<String> content = json['content'].cast<String>().toList();
        final source = json['source'];
        return Scaffold(
          body: Container(
            color: ColorToken.black,
            child: Stack(
              children: [
                SizedBox(
                  height: GetPlatform.isIOS ? Get.height - 80 : Get.height - 64,
                  child: Stack(
                    children: [
                      Screenshot(
                        controller: screenshotController,
                        child: Stack(
                          children: [
                            _getBackground(),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Image.asset(
                                  'asset/drawable/logo_small.png',
                                  width: 64,
                                  height: 64,
                                ),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 32.0,
                                  top: 80,
                                  right: 32,
                                  bottom: 72,
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Html(
                                        data: content.join('<br><br>'),
                                        style: {
                                          "body": Style(
                                            color: ColorToken.white,
                                            fontSize: FontSize(20),
                                            fontWeight: FontWeight.w700,
                                          ),
                                        },
                                      ),
                                      const SizedBox(
                                        height: 42,
                                      ),
                                      Html(
                                        data: source,
                                        style: {
                                          "body": Style(
                                            color: ColorToken.white,
                                            fontSize: FontSize(14),
                                            fontWeight: FontWeight.w700,
                                            textAlign: TextAlign.center,
                                          ),
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top + 16,
                          left: 16,
                        ),
                        child: CircularButtonComponent(
                          icon: Iconography.close,
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      ),
                      // Align(
                      //   alignment: Alignment.bottomRight,
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(16.0),
                      //     child: Wrap(
                      //       children: const [
                      //         CircularButtonComponent(
                      //           icon: Iconography.columns,
                      //         ),
                      //         SizedBox(
                      //           width: 8,
                      //         ),
                      //         CircularButtonComponent(
                      //           icon: Iconography.volumeMax,
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: GetPlatform.isIOS
                        ? const EdgeInsets.only(
                            left: 16.0, bottom: 24, right: 16)
                        : const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: ButtonComponent.text(
                            text: "Share",
                            iconLeft: Iconography.share_06,
                            onPressed: () async {
                              screenshotController.capture().then(
                                (value) async {
                                  File file =
                                      await controller.fileFromUint8List(
                                    value!,
                                  );
                                  Share.shareXFiles(
                                    [XFile(file.path)],
                                    text:
                                        "Renungan Dharma Harian\n\nMari unduh aplikasi Android terbaru Ekayana: https://onelink.to/c97hnx\n\nPersembahan penuh kasih,\nWihara Ekayana Arama\nIndonesia Buddhist Centre",
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 32,
                        ),
                        Expanded(
                          child: ButtonComponent.text(
                            text: "Unduh",
                            iconLeft: Iconography.download_01,
                            style: EkaButtonStyle.naked,
                            onPressed: () {
                              _onPressed(screenshotController, context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _onPressed(
    ScreenshotController screenshotController,
    BuildContext context,
  ) async {
    var permissions = Permission.photosAddOnly;
    // if (Platform.isAndroid) {
    //   final androidInfo = await DeviceInfoPlugin().androidInfo;
    //   if (androidInfo.version.sdkInt <= 32) {
    //     permissions = Permission.storage;
    //   } else {
    //     permissions = Permission.photos;
    //   }
    // }
    final permissionResult = await permissions.status;

    if (permissionResult.isGranted) {
      _doCaptureAndSave(screenshotController);
    } else {
      final result = await showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(16),
            child: Column(
              spacing: 8,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Ekayana ingin mengakses penyimpananmu",
                    style: TypographyToken.textLargeBold),
                Text("Biar kamu bisa download foto di ponselmu.",
                    style: TypographyToken.textSmallRegular),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  spacing: 8,
                  children: [
                    ButtonComponent.text(
                      text: "Batalkan",
                      style: EkaButtonStyle.outline,
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                    ),
                    ButtonComponent.text(
                      text: "Berikan Akses",
                      style: EkaButtonStyle.primary,
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
      if (result == true) {
        final reqStatus = await permissions.request();
        if (reqStatus.isGranted) {
          _doCaptureAndSave(screenshotController);
        } else if (reqStatus.isPermanentlyDenied) {
          openAppSettings();
        } else {
          Get.snackbar(
            "Gagal unduh",
            "Permission Denied",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: ColorToken.error_500,
            colorText: ColorToken.white,
            margin: const EdgeInsets.all(16),
          );
        }
      }
    }
  }

  void _doCaptureAndSave(
    ScreenshotController screenshotController,
  ) {
    screenshotController.capture().then((value) async {
      controller.saveToGallery(value!);
    });
  }

  Widget _getBackground() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage(
            'asset/drawable/${controller.background}',
          ),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
