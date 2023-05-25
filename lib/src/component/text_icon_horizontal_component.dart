import 'package:ekayanaarama/src/design_system/token/color_token.dart';
import 'package:ekayanaarama/src/design_system/token/typography_token.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextIconComponent extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final String icon;
  final Color iconColor;

  const TextIconComponent({
    Key? key,
    required this.text,
    required this.icon,
    this.textStyle,
    this.iconColor = ColorToken.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = this.textStyle ?? TypographyToken.textSmallSemiBold.apply(
      color: ColorToken.white,
    );
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          icon,
          color: iconColor,
          width: 16,
          height: 16,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          text,
          style: textStyle,
        ),
      ],
    );
  }
}
