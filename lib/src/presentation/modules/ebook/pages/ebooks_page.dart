import 'package:ekayanaarama/ekayana.dart';
import 'package:ekayanaarama/src/presentation/component/shimmer/placeholder_component.dart';
import 'package:ekayanaarama/src/presentation/component/shimmer/shimmer.dart';
import 'package:ekayanaarama/src/presentation/modules/ebook/controllers/ebooks_controller.dart';
import 'package:ekayanaarama/src/routes/route_name.dart';
import 'package:ekayanaarama/src/utils/logger_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EbooksPage extends GetView<EbooksController> {
  const EbooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorToken.white,
      appBar: NavBarComponent(
        title: "Ebook Buddhis",
        onNavigationTap: () => Get.back(),
      ),
      body: controller.obx(
        (data) {
          return GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 145 / 220,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: data?.length,
            itemBuilder: (BuildContext ctx, index) {
              final title = data?[index].title ?? "";
              final coverUrl = data?[index].coverUrl ?? "";
              final publisher = data?[index].publisher ?? "";
              final pdfUrl = data?[index].fileUrl ?? "";
              final viewCount = data?[index].viewCount ?? 0;
              final id = data?[index].id ?? 0;
              return EbookComponent(
                title: title,
                coverUrl: coverUrl,
                publisher: publisher,
                viewCount: viewCount,
                onTap: () {
                  controller.incrementView(id);
                  Get.toNamed(
                    RouteName.ebookViewer,
                    parameters: {
                      'title': title,
                      'pdfUrl': pdfUrl,
                    },
                  );
                },
              );
            },
          );
        },
        onLoading: Shimmer(
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 145 / 220,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: 6,
            itemBuilder: (BuildContext ctx, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PlaceholderComponent.rectangle(
                    width: double.infinity,
                    height: 240,
                    radius: BorderRadius.circular(4),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Expanded(
                    child: PlaceholderComponent.rectangle(
                      width: 140,
                      height: 20,
                      radius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Expanded(
                    child: PlaceholderComponent.rectangle(
                      width: 110,
                      height: 12,
                      radius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        onError: (error) {
          LoggerUtils.logHTTPError(error);
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
