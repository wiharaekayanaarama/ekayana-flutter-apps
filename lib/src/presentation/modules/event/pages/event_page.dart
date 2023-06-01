import 'package:ekayanaarama/ekayana.dart';
import 'package:ekayanaarama/src/presentation/modules/event/view/previous_event_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventPage extends StatelessWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBarComponent(
        title: "Event",
        onNavigationTap: () {
          Get.back();
        },
      ),
      backgroundColor: ColorToken.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              InComingEventView(),
              SizedBox(height: 8,),
              PreviousEventView(),
            ],
          ),
        ),
      ),
    );
  }
}

