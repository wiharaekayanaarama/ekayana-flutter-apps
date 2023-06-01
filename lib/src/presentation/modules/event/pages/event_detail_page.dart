import 'dart:io';

import 'package:ekayanaarama/ekayana.dart';
import 'package:ekayanaarama/src/presentation/component/shimmer/placeholder_component.dart';
import 'package:ekayanaarama/src/presentation/component/shimmer/shimmer.dart';
import 'package:ekayanaarama/src/presentation/modules/event/controller/event_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

class EventDetailPage extends GetView<EventDetailController> {
  const EventDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
          (data) {
        final startDate = data?.startDate;
        final endDate = data?.endDate;
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              CollapsingNavBarComponent(
                title: 'Detail Event',
                image: data?.coverImageUrl ?? "",
                onNavigationTap: () => Get.back(),
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: ColorToken.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 16,
                  ),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data?.title ?? "",
                                  style: TypographyToken.headingSmall,
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "Dari ${data?.organizer ?? ""}",
                                  style: TypographyToken.textSmallRegular.apply(
                                    color: ColorToken.gray_500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              File file = await controller.urlToFile(
                                data?.coverImageUrl ?? "",
                              );
                              Share.shareFiles(
                                [file.path],
                                text:
                                "${data?.title} \n${data?.description
                                    .replaceAll("<div>", "").replaceAll(
                                    "<p>", '\n')
                                    .replaceAll("</div>", "")
                                    .replaceAll("</p>", "")
                                }",
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SvgPicture.asset(
                                Iconography.share_07,
                                color: ColorToken.primary_500,
                                width: 20,
                                height: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: _EventIconText(
                          icon: Iconography.calendar,
                          title: DateFormat('dd MMMM yyyy', 'id_ID').format(
                            startDate ?? DateTime.now(),
                          ),
                          subtitle: startDate?.hour != 0 &&
                              startDate?.minute != 0 &&
                              startDate?.second != 0
                              ? "${startDate?.hour}:${startDate
                              ?.minute} - ${endDate?.hour}:${endDate
                              ?.minute} WIB"
                              : null,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24.0),
                        child: _EventIconText(
                          icon: Iconography.markerPin_01,
                          title: data?.location ?? "",
                          subtitle: null,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: Text(
                          "Deskripsi",
                          style: TypographyToken.textMediumBold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Html(
                          data: data?.description,
                          style: {
                            "body": Style(
                              fontSize: FontSize(
                                  TypographyToken.textSmallRegular.fontSize),
                              margin: EdgeInsets.zero,
                            ),
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
      onLoading: Container(
        color: ColorToken.white,
        child: Shimmer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PlaceholderComponent.rectangle(
                width: Get.width,
                height: 250,
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: PlaceholderComponent.rectangle(
                  width: Get.width / 2,
                  height: 24,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: PlaceholderComponent.rectangle(
                  width: Get.width / 4,
                  height: 16,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: PlaceholderComponent.rectangle(
                  width: Get.width / 2.5,
                  height: 12,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: PlaceholderComponent.rectangle(
                  width: Get.width / 4,
                  height: 12,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: PlaceholderComponent.rectangle(
                  width: Get.width / 2.5,
                  height: 12,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: PlaceholderComponent.rectangle(
                  width: Get.width / 4,
                  height: 12,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: PlaceholderComponent.rectangle(
                  width: Get.width / 6,
                  height: 16,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: PlaceholderComponent.rectangle(
                  width: Get.width,
                  height: 12,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: PlaceholderComponent.rectangle(
                  width: Get.width,
                  height: 12,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: PlaceholderComponent.rectangle(
                  width: Get.width,
                  height: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EventIconText extends StatelessWidget {
  final String icon;
  final String title;
  final String? subtitle;

  const _EventIconText({
    Key? key,
    required this.icon,
    required this.title,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 36,
          width: 36,
          decoration: BoxDecoration(
            color: ColorToken.gray_0,
            borderRadius: BorderRadius.circular(500),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              icon,
              color: ColorToken.gray_200,
            ),
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (subtitle != null) ...[
              Text(
                title,
                style: TypographyToken.textSmallSemiBold.apply(
                  color: ColorToken.gray_500,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                subtitle!,
                style: TypographyToken.textSmallBold,
              ),
            ] else
              ...[
                Text(
                  title,
                  style: TypographyToken.textSmallBold,
                ),
              ]
          ],
        ),
      ],
    );
  }
}
