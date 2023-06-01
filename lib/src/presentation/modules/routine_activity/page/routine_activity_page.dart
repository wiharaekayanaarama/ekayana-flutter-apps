import 'package:ekayanaarama/ekayana.dart';
import 'package:ekayanaarama/src/presentation/component/filter_activity_component.dart';
import 'package:ekayanaarama/src/presentation/modules/routine_activity/controller/routine_activity_view_controller.dart';
import 'package:ekayanaarama/src/presentation/modules/routine_activity/utils/routine_utils.dart';
import 'package:ekayanaarama/src/presentation/modules/routine_activity/view/routine_activity_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoutineActivityPage extends GetView<RoutineActivityViewController> {
  const RoutineActivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorToken.white,
      appBar: NavBarComponent(
        title: "Kegiatan Rutin",
        onNavigationTap: () => Get.back(),
      ),
      body: SingleChildScrollView(
        child: Wrap(
          children: [
            SizedBox(
              height: 104,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: controller.categories.length,
                itemBuilder: (context, index) {
                  return Obx(
                    () {
                      return FilterActivityComponent(
                        category: controller.categories[index].capitalize ?? "",
                        icon: controller.categories[index].getActivityIcon,
                        isSelected: controller.selectedCategory.value == controller.categories[index],
                        onTap: () {
                          controller.filterActivities(controller.categories[index]);
                        },
                      );
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 8,
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 34.0),
              child: RoutineActivityView(),
            ),
          ],
        ),
      ),
    );
  }
}
