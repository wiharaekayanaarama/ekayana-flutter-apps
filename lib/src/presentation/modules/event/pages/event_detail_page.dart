import 'dart:io';

import 'package:ekayanaarama/ekayana.dart';
import 'package:ekayanaarama/src/presentation/component/shimmer/placeholder_component.dart';
import 'package:ekayanaarama/src/presentation/component/shimmer/shimmer.dart';
import 'package:ekayanaarama/src/presentation/component/tap_container.dart';
import 'package:ekayanaarama/src/presentation/modules/event/controller/event_detail_controller.dart';
import 'package:ekayanaarama/src/utils/date_utils.dart';
import 'package:ekayanaarama/src/utils/map_utils.dart';
import 'package:ekayanaarama/src/utils/logger_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class EventDetailPage extends GetView<EventDetailController> {
  const EventDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (data) {
        final startDate = data?.startDate ?? DateTime.now();
        final endDate = data?.endDate ?? DateTime.now();

        var titleDateText = "";
        String? subtitleDateText;

        if (startDate.isSameDate(endDate)) {
          titleDateText = DateFormat('dd MMMM yyyy', 'id_ID').format(startDate);
          subtitleDateText = "${DateFormat('kk:mm', 'id_ID').format(startDate)} - ${DateFormat('kk:mm', 'id_ID').format(endDate)} WIB";
        } else {
          titleDateText = "${DateFormat('dd MMMM yyyy kk:mm', 'id_ID').format(startDate)} WIB - ${DateFormat('dd MMMM yyyy kk:mm', 'id_ID').format(endDate)} WIB";
          subtitleDateText = null;
        }

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
                      Center(
                        child: Container(
                          height: 3,
                          width: 56,
                          decoration: BoxDecoration(
                              color: ColorToken.gray_200,
                              borderRadius: BorderRadius.circular(16)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                    style:
                                        TypographyToken.textSmallRegular.apply(
                                      color: ColorToken.gray_500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Tappable(
                              borderRadius: BorderRadius.circular(100),
                              onTap: () async {
                                File file = await controller.urlToFile(
                                  data?.coverImageUrl ?? "",
                                );
                                Share.shareXFiles(
                                  [XFile(file.path)],
                                  text:
                                      "${data?.title} \n${data?.description?.replaceAll("<div>", "").replaceAll("<p>", '\n').replaceAll("</div>", "").replaceAll("</p>", "")}",
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
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: _EventIconText(
                          icon: Iconography.calendar,
                          title: titleDateText,
                          subtitle: subtitleDateText,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: _EventIconText(
                                icon: Iconography.markerPin_01,
                                title: data?.location ?? "",
                                subtitle: data?.address,
                              ),
                            ),
                            ButtonComponent.icon(
                              onPressed: () {
                                MapUtils.url(
                                  url: data?.mapsUrl ?? "",
                                ).launch();
                              },
                            ),
                          ],
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
                          data: data?.description?.replaceAll("<br/>", "<p><br/><p>"),
                          style: {
                            "body": Style(
                              fontSize: FontSize(
                                TypographyToken.textSmallRegular.fontSize ?? 0,
                              ),
                              margin: Margins.zero,
                            ),
                            "p": Style(
                              fontSize: FontSize(
                                TypographyToken.textSmallRegular.fontSize ?? 0,
                              ),
                              lineHeight: LineHeight.em(1),
                              margin: Margins.zero,
                            ),
                            "p > br": Style(
                              fontSize: FontSize(4),
                              lineHeight: LineHeight.em(1),
                              margin: Margins.zero,
                            ),
                          },
                          onLinkTap: (String? url,
                              Map<String, String> attributes, __) async {
                            await launchUrl(Uri.parse(url ?? ""),
                                mode: LaunchMode.externalApplication);
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
      onError: (error) {
        LoggerUtils.logHTTPError(error);
        return const SizedBox.shrink();
      },
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
        Expanded(
          child: Column(
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
              ] else ...[
                Text(
                  title,
                  style: TypographyToken.textSmallBold,
                ),
              ]
            ],
          ),
        ),
      ],
    );
  }
}
