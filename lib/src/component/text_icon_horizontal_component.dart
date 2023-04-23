import 'package:ekayanaarama/src/design_system/token/color_token.dart';
import 'package:ekayanaarama/src/design_system/token/typography_token.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextIconComponent extends StatelessWidget {
  final String text;
  final String icon;
  final Color color;

  const TextIconComponent({
    Key? key,
    required this.text,
    required this.icon,
    this.color = ColorToken.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          icon,
          colorFilter: ColorFilter.mode(
            color,
            BlendMode.srcIn,
          ),
          width: 16,
          height: 16,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          text,
          style: TypographyToken.textSmallSemiBold.apply(
            color: color,
          ),
        ),
      ],
    );
  }
}
