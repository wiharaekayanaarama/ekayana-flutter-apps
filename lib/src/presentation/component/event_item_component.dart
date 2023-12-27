import 'package:cached_network_image/cached_network_image.dart';
import 'package:ekayanaarama/ekayana.dart';
import 'package:ekayanaarama/src/presentation/component/tap_container.dart';
import 'package:ekayanaarama/src/utils/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventItemComponent extends StatelessWidget {
  final String coverImageUrl;
  final DateTime startDate;
  final DateTime endDate;
  final String title;
  final String location;
  final VoidCallback? onTap;

  final double _width = 225;
  final double _height = 280;

  const EventItemComponent({
    Key? key,
    required this.coverImageUrl,
    required this.startDate,
    required this.endDate,
    required this.title,
    required this.location,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: CachedNetworkImage(
            imageUrl: coverImageUrl,
            fit: BoxFit.cover,
            width: _width,
            height: _height,
            placeholder: (context, _) {
              return const ImageLoadPlaceholderComponent();
            },
          ),
        ),
        Tappable(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.85),
                ],
              ),
            ),
          ),
        ),
        IgnorePointer(
          child: Padding(
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
                    startDate.month.getMonthString,
                    style: TypographyToken.textMediumSemiBold.apply(
                      color: ColorToken.black,
                    ),
                  ),
                  Text(
                    startDate.day.toString(),
                    style: TypographyToken.textMediumBold.apply(
                      color: ColorToken.primary_500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        IgnorePointer(
          child: SizedBox(
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
                      title,
                      style: TypographyToken.textMediumBold.apply(
                        color: ColorToken.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  if (startDate.isSameDate(endDate)) ...[
                    Flexible(
                      child: TextIconComponent(
                        text: "${DateFormat('kk:mm', 'id_ID').format(
                            startDate,
                          )} - ${DateFormat('kk:mm', 'id_ID').format(
                            endDate,
                          )} WIB",
                        iconLeft: Iconography.clock,
                        iconColor: ColorToken.white,
                      ),
                    ),
                  ],
                  const SizedBox(
                    height: 12,
                  ),
                  Flexible(
                    child: TextIconComponent(
                      text: location,
                      iconLeft: Iconography.markerPin_01,
                      iconColor: ColorToken.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
