import 'package:ekayanaarama/ekayana.dart';
import 'package:ekayanaarama/src/presentation/component/shimmer/placeholder_component.dart';
import 'package:ekayanaarama/src/presentation/component/shimmer/shimmer.dart';
import 'package:ekayanaarama/src/presentation/modules/event/controller/incoming_events_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InComingEventView extends GetView<IncomingEventsController> {
  final PageController pageController;

  const InComingEventView({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (data) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Event yang akan datang", style: TypographyToken.headingSmall),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              height: 280,
              child: PageView.builder(
                controller: pageController,
                padEnds: true,
                itemCount: data?.length,
                pageSnapping: true,
                itemBuilder: (context, index) {
                  return EventItemComponent(
                    coverImageUrl: data?[index].coverImageUrl ?? "",
                    startDate: data?[index].startDate ?? DateTime.now(),
                    endDate: data?[index].endDate ?? DateTime.now(),
                    title: data?[index].title ?? "",
                    location: data?[index].location ?? "",
                  );
                },
              ),
            ),
          ],
        );
      },
      onLoading: Shimmer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PlaceholderComponent.rectangle(
              width: 200,
              height: 15,
              radius: BorderRadius.circular(4),
            ),
            const SizedBox(height: 12,),
            Row(
              children: [
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 225 / 280,
                    child: PlaceholderComponent.rectangle(
                      width: double.infinity,
                      height: double.infinity,
                      radius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                const SizedBox(width: 8,),
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 225 / 280,
                    child: PlaceholderComponent.rectangle(
                      width: double.infinity,
                      height: double.infinity,
                      radius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}