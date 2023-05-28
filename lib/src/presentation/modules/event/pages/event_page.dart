import 'package:cached_network_image/cached_network_image.dart';
import 'package:ekayanaarama/ekayana.dart';
import 'package:ekayanaarama/src/presentation/modules/event/pages/incoming_event_composite.dart';
import 'package:ekayanaarama/src/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
            children: [
              InComingEventComposite(
                pageController: PageController(viewportFraction: 0.63),
              ),
              Text(
                "Event sebelumnya",
                style: TypographyToken.textLargeBold,
              ),
              _PreviousEvent(),
            ],
          ),
        ),
      ),
    );
  }
}

class _PreviousEvent extends StatelessWidget {
  const _PreviousEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        InkWell(
          onTap: () => Get.toNamed(RouteName.eventDetail),
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: ColorToken.gray_0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: const Image(
                    image: CachedNetworkImageProvider(
                      'https://via.placeholder.com/225x280',
                    ),
                    fit: BoxFit.cover,
                    width: 72,
                    height: 72,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Title Event",
                      style: TypographyToken.textMediumBold,
                    ),
                    Text(
                      "Dari Ekayana",
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
                          "28 November 2023",
                          style: TypographyToken.textSmallRegular.apply(
                            color: ColorToken.gray_500,
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
