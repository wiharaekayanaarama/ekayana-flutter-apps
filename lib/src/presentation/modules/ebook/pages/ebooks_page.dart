import 'package:ekayanaarama/ekayana.dart';
import 'package:ekayanaarama/src/presentation/component/shimmer/placeholder_component.dart';
import 'package:ekayanaarama/src/presentation/component/shimmer/shimmer.dart';
import 'package:ekayanaarama/src/presentation/modules/ebook/controllers/ebooks_controller.dart';
import 'package:ekayanaarama/src/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EbooksPage extends GetView<EbooksController> {
  const EbooksPage({Key? key}) : super(key: key);

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
              return EbookComponent(
                title: title,
                coverUrl: coverUrl,
                publisher: publisher,
                onTap: () {
                  Get.toNamed(
                    RouteName.ebookViewer,
                    arguments: {
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
                    width: 160,
                    height: 200,
                    radius: BorderRadius.circular(4),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  PlaceholderComponent.rectangle(
                    width: 140,
                    height: 20,
                    radius: BorderRadius.circular(4),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  PlaceholderComponent.rectangle(
                    width: 110,
                    height: 12,
                    radius: BorderRadius.circular(4),
                  ),
                ],
              );
            },
          ),
        ),
        onError: (error) {
          return Text(error ?? "");
        },
      ),
    );
  }
}
