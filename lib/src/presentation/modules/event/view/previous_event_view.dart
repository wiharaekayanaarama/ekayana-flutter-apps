import 'package:cached_network_image/cached_network_image.dart';
import 'package:ekayanaarama/ekayana.dart';
import 'package:ekayanaarama/src/presentation/component/shimmer/placeholder_component.dart';
import 'package:ekayanaarama/src/presentation/component/shimmer/shimmer.dart';
import 'package:ekayanaarama/src/presentation/component/tap_container.dart';
import 'package:ekayanaarama/src/presentation/modules/event/controller/previous_event_controller.dart';
import 'package:ekayanaarama/src/routes/route_name.dart';
import 'package:ekayanaarama/src/utils/logger_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PreviousEventView extends GetView<PreviousEventsController> {
  const PreviousEventView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (data) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Event sebelumnya",
              style: TypographyToken.textLargeBold,
            ),
            const SizedBox(
              height: 8,
            ),
            ListView.separated(
              itemCount: data?.length ?? 0,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: ColorToken.gray_0,
                  ),
                  child: Tappable(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      Get.toNamed(RouteName.eventDetail, arguments: {
                        'id': data?[index].id,
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              imageUrl: data?[index].coverImageUrl ?? "",
                              fit: BoxFit.cover,
                              width: 72,
                              height: 72,
                              placeholder: (context, _) {
                                return const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: ImageLoadPlaceholderComponent(),
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data?[index].title ?? "",
                                  style: TypographyToken.textMediumBold,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "Dari ${data?[index].organizer}",
                                  style: TypographyToken.textSmallRegular.apply(
                                    color: ColorToken.gray_500,
                                  ),
                                ),
                                const SizedBox(
                                  height: 22,
                                ),
                                Wrap(
                                  children: [
                                    SvgPicture.asset(
                                      Iconography.calendar,
                                      height: 16,
                                      width: 16,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      DateFormat('dd MMMM yyyy', 'id_ID')
                                          .format(
                                        data?[index].startDate ??
                                            DateTime.now(),
                                      ),
                                      style: TypographyToken.textSmallRegular
                                          .apply(
                                        color: ColorToken.gray_500,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 8,
                );
              },
            )
          ],
        );
      },
      onLoading: Shimmer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PlaceholderComponent.rectangle(
              width: 200,
              height: 12,
              radius: BorderRadius.circular(4),
            ),
            const SizedBox(
              height: 12,
            ),
            PlaceholderComponent.rectangle(
              width: double.infinity,
              height: 80,
              radius: BorderRadius.circular(4),
            ),
            const SizedBox(
              height: 12,
            ),
            PlaceholderComponent.rectangle(
              width: double.infinity,
              height: 80,
              radius: BorderRadius.circular(4),
            ),
            const SizedBox(
              height: 12,
            ),
            PlaceholderComponent.rectangle(
              width: double.infinity,
              height: 80,
              radius: BorderRadius.circular(4),
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
