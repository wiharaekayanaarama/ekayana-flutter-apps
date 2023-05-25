import 'package:ekayanaarama/ekayana.dart';
import 'package:ekayanaarama/src/controller/buddhavacana_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class BuddhavacanaDetailPage extends GetView<BuddhavacanaDetailController> {
  const BuddhavacanaDetailPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorToken.white,
      appBar: NavBarComponent(
        title: controller.title,
        backIcon: Iconography.close,
        onNavigationTap: () => Get.back(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Html(data: controller.contents.join('<br><br>')),
            const SizedBox(
              height: 16,
            ),
            Text(controller.source, style: TypographyToken.textSmallBold),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
