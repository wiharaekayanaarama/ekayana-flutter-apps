import 'package:ekayanaarama/ekayana.dart';
import 'package:ekayanaarama/src/component/ebook_component.dart';
import 'package:ekayanaarama/src/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EbooksPage extends StatelessWidget {
  const EbooksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorToken.white,
      appBar: NavBarComponent(
        title: "Ebook Buddhis",
        onNavigationTap: () => Get.back(),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 145 / 220,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: 6,
        itemBuilder: (BuildContext ctx, index) {
          return EbookComponent(
            title: 'Buddha dan Dhammanyaa',
            coverUrl: 'https://is3.cloudhost.id/ekayana-prod/cover_a803c685-6ce1-4f0b-839c-e31cb71a9543.png',
            publisher: 'Dari Dian Dharma',
            onTap: () {
              Get.toNamed(
                RouteName.ebookViewer,
                arguments: {
                  'title': 'Buddha dan Dhammanyaa',
                  'pdfUrl': 'https://is3.cloudhost.id/ekayana-prod/book_b226df34-2e4e-48c8-a367-6dff74e4286f.pdf',
                },
              );
            },
          );
        },
      ),
    );
  }
}
