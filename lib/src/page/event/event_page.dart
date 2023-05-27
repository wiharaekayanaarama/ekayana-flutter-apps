import 'package:cached_network_image/cached_network_image.dart';
import 'package:ekayanaarama/ekayana.dart';
import 'package:ekayanaarama/src/routes/route_name.dart';
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InComingEventComposite(
              pageController: PageController(viewportFraction: 0.63),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: _PreviousEvent(),
          ),
        ],
      ),
    );
  }
}

class _PreviousEvent extends StatelessWidget {
  const _PreviousEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Event sebelumnya",
          style: TypographyToken.textLargeBold,
        ),
        const SizedBox(height: 8,),
        Container(
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
              InkWell(
                onTap: () {
                  Get.toNamed(RouteName.eventDetail);
                },
                child: SizedBox(
                  height: 72,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          "Title Event",
                          style: TypographyToken.textMediumBold,
                        ),
                      ),
                      Text(
                        "Dari Ekayana",
                        style: TypographyToken.textSmallRegular.apply(
                          color: ColorToken.gray_500,
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                            child: TextIconComponent(
                              text: "28 November 2023",
                              textStyle: TypographyToken.textSmallRegular.apply(
                                color: ColorToken.gray_500,
                              ),
                              iconLeft: Iconography.calendar,
                              iconColor: ColorToken.gray_500,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
