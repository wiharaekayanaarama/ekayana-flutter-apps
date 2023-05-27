import 'package:cached_network_image/cached_network_image.dart';
import 'package:ekayanaarama/src/component/text_icon_horizontal_component.dart';
import 'package:ekayanaarama/src/design_system/iconography/iconography.dart';
import 'package:ekayanaarama/src/design_system/token/typography_token.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../design_system/token/color_token.dart';

class EventItemComponent extends StatelessWidget {
  final double _width = 225;
  final double _height = 280;

  const EventItemComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image(
            image: const CachedNetworkImageProvider(
              'https://via.placeholder.com/225x280',
            ),
            fit: BoxFit.cover,
            width: _width,
            height: _height,
          ),
        ),
        Container(
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.5),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: ColorToken.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Nov",
                  style: TypographyToken.textMediumSemiBold.apply(
                    color: ColorToken.black,
                  ),
                ),
                Text(
                  "28",
                  style: TypographyToken.textMediumBold.apply(
                    color: ColorToken.primary_500,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: _width,
          height: _height,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: Text(
                    "Title event",
                    style: TypographyToken.textMediumBold.apply(
                      color: ColorToken.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Flexible(
                  child: TextIconComponent(
                    text: "08:00 - 12:00 WIB",
                    iconLeft: Iconography.clock,
                    iconColor: ColorToken.white,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Flexible(
                  child: TextIconComponent(
                    text: "Indonesia  (ICE) BSD City",
                    iconLeft: Iconography.markerPin_01,
                    iconColor: ColorToken.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
