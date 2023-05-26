import 'package:ekayanaarama/ekayana.dart';
import 'package:ekayanaarama/src/component/buddhavacana_item_component.dart';
import 'package:ekayanaarama/src/controller/buddhavacana_controller.dart';
import 'package:ekayanaarama/src/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:number_paginator/number_paginator.dart';

class BuddhavacanaPage extends GetView<BuddhavacanaController> {
  const BuddhavacanaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBarComponent(
        title: "Buddhavacana",
        onNavigationTap: () => Get.back(),
      ),
      body: FutureBuilder(
        future: controller.buddhavacanaJson,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (!snapshot.hasData) return const SizedBox.shrink();

          final Map<String, dynamic> json = snapshot.data;
          final buddhavacana = json['buddhavacana'];
          final int buddhavacanaLength = buddhavacana.length;
          return Container(
            color: Colors.white,
            child: Obx(() {
              return Stack(
                children: [
                  ListView.builder(
                    itemCount: 7,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var _index = index + (controller.currentPage.value * 7);
                      if (buddhavacanaLength <= _index) return const SizedBox.shrink();

                      final title = buddhavacana[_index]["title"];
                      final List<String> contents = buddhavacana[_index]
                              ["contents"]
                          .cast<String>()
                          .toList();
                      final source = buddhavacana[_index]["source"];
                      return BuddhavacanaItemComponent(
                        number: (_index + 1).toString(),
                        title: title,
                        description: contents[0],
                        onTap: () {
                          Get.toNamed(
                            RouteName.buddavacanaDetail,
                            arguments: {
                              'title': title,
                              'contents': contents,
                              'source': source,
                            },
                          );
                        },
                      );
                    },
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: NumberPaginator(
                        numberPages: (buddhavacanaLength / 7).ceil(),
                        initialPage: controller.currentPage.value,
                        onPageChange: (page) {
                          controller.currentPage.value = page;
                        },
                        config: const NumberPaginatorUIConfig(
                          height: 42,
                          buttonSelectedForegroundColor: ColorToken.primary_500,
                          buttonSelectedBackgroundColor: ColorToken.primary_0,
                          buttonUnselectedBackgroundColor: ColorToken.white,
                          buttonUnselectedForegroundColor: ColorToken.black,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
          );
        },
      ),
    );
  }

}
