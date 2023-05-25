import 'package:ekayanaarama/src/component/nav_bar_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../ekayana.dart';

class EventDetailPage extends StatelessWidget {
  const EventDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CollapsingNavBarComponent(
            title: 'Detail Event',
            image: "https://via.placeholder.com/250x280",
            onNavigationTap: () {},
          ),
          SliverToBoxAdapter(
            child: Container(
              height: MediaQuery.of(context).size.height,
              color: ColorToken.white,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Title Event",
                            style: TypographyToken.headingSmall,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Dari Ekayana",
                            style: TypographyToken.textSmallRegular.apply(
                              color: ColorToken.gray_500,
                            ),
                          ),
                        ],
                      ),
                      SvgPicture.asset(
                        Iconography.share_07,
                        color: ColorToken.primary_500,
                        width: 16,
                        height: 16,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const _EventIconText(
                    icon: Iconography.calendar,
                    title: "28 November 2023",
                    subtitle: "08:00 - 12:00 WIB",
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const _EventIconText(
                    icon: Iconography.markerPin_01,
                    title: "Jakarta Barat, Indonesia",
                    subtitle: "Indonesia Convention Exhibition",
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Deskripsi",
                    style: TypographyToken.textMediumBold,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "Lorem ipsum dolor sit amet consectetur. Fusce faucibus turpis potenti risus velit sapien. Amet sit vitae metus felis. Sodales id tempus libero interdum gravida aenean. Ac tellus tellus viverra amet egestas facilisis etiam ullamcorper malesuada. Accumsan pretium tellus quam aliquet cursus viverra semper. " +
                        "Eget nunc tellus elementum elementum cras aliquam sit. At sed lobortis interdum tortor. Platea varius viverra elit auctor bibendum vel purus. Lorem ipsum dolor sit amet consectetur. Fusce faucibus turpis potenti risus velit sapien. Amet sit vitae metus felis. Sodales id tempus libero interdum gravida aenean. Ac tellus tellus viverra amet egestas facilisis etiam ullamcorper malesuada. Accumsan pretium tellus quam aliquet cursus viverra semper." +
                        "Eget nunc tellus elementum elementum cras aliquam sit. At sed lobortis interdum tortor. Platea varius viverra elit auctor bibendum vel purus.",
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EventIconText extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;

  const _EventIconText({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
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
              subtitle,
              style: TypographyToken.textSmallBold,
            ),
          ],
        ),
      ],
    );
  }
}
