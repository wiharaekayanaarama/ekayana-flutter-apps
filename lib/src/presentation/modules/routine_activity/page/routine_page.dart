import 'package:ekayanaarama/ekayana.dart';
import 'package:ekayanaarama/src/presentation/modules/routine_activity/view/routine_activity_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoutinePage extends StatelessWidget {
  const RoutinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorToken.white,
      appBar: NavBarComponent(
        title: "Kegiatan Rutin",
        onNavigationTap: () => Get.back(),
      ),
      body: const SingleChildScrollView(
        child: RoutineActivityView(),
      ),
    );
  }
}
