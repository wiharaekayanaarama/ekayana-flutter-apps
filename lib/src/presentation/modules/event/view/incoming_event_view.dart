import 'package:ekayanaarama/ekayana.dart';
import 'package:ekayanaarama/src/presentation/component/shimmer/placeholder_component.dart';
import 'package:ekayanaarama/src/presentation/component/shimmer/shimmer.dart';
import 'package:ekayanaarama/src/presentation/modules/event/controller/incoming_events_controller.dart';
import 'package:ekayanaarama/src/routes/route_name.dart';
import 'package:ekayanaarama/src/utils/logger_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InComingEventView extends GetView<IncomingEventsController> {

  final EdgeInsetsGeometry padding;

  const InComingEventView({
    super.key,
    this.padding = const EdgeInsets.all(0),
  });

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (data) {
        if (data == null) return const SizedBox.shrink();
        return Padding(
          padding: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Event yang akan datang", style: TypographyToken.headingSmall),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                height: 280,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return EventItemComponent(
                      coverImageUrl: data[index].coverImageUrl ?? "",
                      startDate: data[index].startDate ?? DateTime.now(),
                      endDate: data[index].endDate ?? DateTime.now(),
                      title: data[index].title ?? "",
                      location: data[index].location ?? "",
                      onTap: () {
                        Get.toNamed(RouteName.getEventDetail(data[index].id));
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
            ],
          ),
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
            const SizedBox(
              height: 12,
            ),
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
                const SizedBox(
                  width: 8,
                ),
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
      onError: (error) {
        LoggerUtils.logHTTPError(error);
        return const SizedBox.shrink();
      },
    );
  }
}
