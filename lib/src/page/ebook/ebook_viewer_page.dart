import 'package:ekayanaarama/ekayana.dart';
import 'package:ekayanaarama/src/controller/ebook_viewer_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EbookViewerPage extends GetView<EbookViewerController> {
  const EbookViewerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorToken.white,
      appBar: NavBarComponent(
        title: controller.title,
        onNavigationTap: () => Get.back(),
      ),
      body: Column(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: Get.height - 150),
            child: PDF(
              swipeHorizontal: true,
              onViewCreated: (PDFViewController pdfViewController) async {
                controller.pdfViewController.complete(pdfViewController);
              },
              onPageChanged: (int? currentPage, int? totalPage) {
                controller.currentPage.value = currentPage ?? 1;
                controller.totalPage.value = totalPage ?? 0;
              },
            ).cachedFromUrl(
              controller.pdfUrl,
            ),
          ),
          FutureBuilder<PDFViewController>(
            future: controller.pdfViewController.future,
            builder: (_, AsyncSnapshot<PDFViewController> snapshot) {
              return Obx(
                () {
                  final isFirstPage = controller.currentPage.value == 0;
                  final isLastPage = controller.currentPage.value == controller.totalPage.value - 1;
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: !isFirstPage ? () async {
                            await snapshot.data?.setPage(controller.currentPage.value - 1);
                          } : null,
                          child: SvgPicture.asset(
                            Iconography.chevronLeft,
                            height: 18,
                            width: 18,
                            color: !isFirstPage ? ColorToken.black : ColorToken.gray_400,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            "Hal ${controller.currentPage.value + 1} / ${controller.totalPage.value}",
                            style: TypographyToken.textSmallSemiBold,
                          ),
                        ),
                        InkWell(
                          onTap: !isLastPage ? () async {
                            await snapshot.data?.setPage(controller.currentPage.value + 1);
                          } : null,
                          child: SvgPicture.asset(
                            Iconography.chevronRight,
                            height: 18,
                            width: 18,
                            color: !isLastPage ? ColorToken.black : ColorToken.gray_400,
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
