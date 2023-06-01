import 'package:ekayanaarama/ekayana.dart';
import 'package:ekayanaarama/src/presentation/component/shimmer/placeholder_component.dart';
import 'package:ekayanaarama/src/presentation/component/shimmer/shimmer.dart';
import 'package:ekayanaarama/src/presentation/modules/home/controllers/home_activity_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeActivityView extends GetView<HomeActivityController> {
  const HomeActivityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (data) {
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: data?.length ?? 0,
          itemBuilder: (context, index) {
            return AgendaItemComponent(
              title: data?[index].title ?? "",
              time: "${data?[index].time} WIB",
              location: data?[index].location ?? "",
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 8,
            );
          },
        );
      },
      onLoading: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xffF6F7F8),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Shimmer(
              colors: [
                ColorToken.gray_50,
                ColorToken.gray_100.withOpacity(0.1),
                ColorToken.gray_50,
              ],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const PlaceholderComponent.circle(size: 32),
                        const SizedBox(
                          width: 8,
                        ),
                        PlaceholderComponent.rectangle(
                          width: Get.width / 1.5,
                          height: 16,
                          radius: BorderRadius.circular(4),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    PlaceholderComponent.rectangle(
                      width: Get.width / 1.5,
                      height: 12,
                      radius: BorderRadius.circular(4),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    PlaceholderComponent.rectangle(
                      width: Get.width / 1.5,
                      height: 12,
                      radius: BorderRadius.circular(4),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xffF6F7F8),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Shimmer(
              colors: [
                ColorToken.gray_50,
                ColorToken.gray_100.withOpacity(0.1),
                ColorToken.gray_50,
              ],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const PlaceholderComponent.circle(size: 32),
                        const SizedBox(
                          width: 8,
                        ),
                        PlaceholderComponent.rectangle(
                          width: Get.width / 1.5,
                          height: 16,
                          radius: BorderRadius.circular(4),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    PlaceholderComponent.rectangle(
                      width: Get.width / 1.5,
                      height: 12,
                      radius: BorderRadius.circular(4),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    PlaceholderComponent.rectangle(
                      width: Get.width / 1.5,
                      height: 12,
                      radius: BorderRadius.circular(4),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xffF6F7F8),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Shimmer(
              colors: [
                ColorToken.gray_50,
                ColorToken.gray_100.withOpacity(0.1),
                ColorToken.gray_50,
              ],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const PlaceholderComponent.circle(size: 32),
                        const SizedBox(
                          width: 8,
                        ),
                        PlaceholderComponent.rectangle(
                          width: Get.width / 1.5,
                          height: 16,
                          radius: BorderRadius.circular(4),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    PlaceholderComponent.rectangle(
                      width: Get.width / 1.5,
                      height: 12,
                      radius: BorderRadius.circular(4),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    PlaceholderComponent.rectangle(
                      width: Get.width / 1.5,
                      height: 12,
                      radius: BorderRadius.circular(4),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xffF6F7F8),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Shimmer(
              colors: [
                ColorToken.gray_50,
                ColorToken.gray_100.withOpacity(0.1),
                ColorToken.gray_50,
              ],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const PlaceholderComponent.circle(size: 32),
                        const SizedBox(
                          width: 8,
                        ),
                        PlaceholderComponent.rectangle(
                          width: Get.width / 1.5,
                          height: 16,
                          radius: BorderRadius.circular(4),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    PlaceholderComponent.rectangle(
                      width: Get.width / 1.5,
                      height: 12,
                      radius: BorderRadius.circular(4),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    PlaceholderComponent.rectangle(
                      width: Get.width / 1.5,
                      height: 12,
                      radius: BorderRadius.circular(4),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
