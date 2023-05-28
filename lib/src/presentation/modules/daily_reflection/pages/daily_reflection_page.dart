import 'dart:io';

import 'package:ekayanaarama/ekayana.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
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
        return Container(
          color: ColorToken.black,
          child: Stack(
            children: [
              SizedBox(
                height: Get.height - 64,
                child: Stack(
                  children: [
                    Screenshot(
                      controller: screenshotController,
                      child: Stack(
                        children: [
                          _getBackground(),
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Html(
                                      data: content.join('<br><br>'),
                                      style: {
                                        "body": Style(
                                          color: ColorToken.white,
                                          fontSize: const FontSize(20),
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
                                          fontSize: const FontSize(14),
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
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Wrap(
                          children: const [
                            CircularButtonComponent(
                              icon: Iconography.columns,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            CircularButtonComponent(
                              icon: Iconography.volumeMax,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ButtonComponent(
                          text: "Share",
                          iconLeft: Iconography.share_06,
                          onPressed: () async {
                            screenshotController.capture().then((value) async {
                              File file =
                                  await controller.fileFromUint8List(value!);
                              Share.shareFiles([file.path]);
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 32,
                      ),
                      Expanded(
                        child: ButtonComponent(
                          text: "Unduh",
                          iconLeft: Iconography.download_01,
                          style: EkaButtonStyle.naked,
                          onPressed: () async {
                            screenshotController.capture().then((value) async {
                              controller.saveToGallery(value!);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
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