import 'package:ekayanaarama/ekayana.dart';
import 'package:ekayanaarama/src/controller/about_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class AboutDetailPage extends GetView<AboutDetailController> {
  const AboutDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorToken.white,
      appBar: NavBarComponent(
        title: "Tentang Ekayana",
        onNavigationTap: () => Get.back(),
      ),
      body: SingleChildScrollView(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Html(data: controller.content,),
      )),
    );
  }
}
