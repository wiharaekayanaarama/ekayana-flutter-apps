import 'package:ekayanaarama/ekayana.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AgendaItemComponent extends StatelessWidget {
  final String title;
  final String time;
  final String location;
  final String icon;

  const AgendaItemComponent({
    Key? key,
    required this.title,
    required this.time,
    required this.location,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: ColorToken.gray_0,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorToken.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: SvgPicture.asset(
                    icon,
                    color: ColorToken.primary_500,
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Text(
                  title,
                  style: TypographyToken.textMediumBold,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: TextIconComponent(
              text: time,
              textStyle: TypographyToken.textSmallSemiBold.apply(
                color: ColorToken.gray_500,
              ),
              iconLeft: Iconography.clock,
              iconColor: ColorToken.gray_500,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: TextIconComponent(
              text: location,
              textStyle: TypographyToken.textSmallSemiBold.apply(
                color: ColorToken.gray_500,
              ),
              iconLeft: Iconography.markerPin_01,
              iconColor: ColorToken.gray_500,
            ),
          )
        ],
      ),
    );
  }
}
