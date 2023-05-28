import 'package:ekayanaarama/ekayana.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextIconComponent extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final String? iconLeft;
  final String? iconRight;
  final Color iconColor;

  const TextIconComponent({
    Key? key,
    required this.text,
    this.iconLeft,
    this.iconRight,
    this.textStyle,
    this.iconColor = ColorToken.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = this.textStyle ?? TypographyToken.textSmallSemiBold.apply(
      color: ColorToken.white,
    );
    final iconLeft = this.iconLeft;
    final iconRight = this.iconRight;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (iconLeft != null) ...[
          SvgPicture.asset(
            iconLeft,
            color: iconColor,
            width: 16,
            height: 16,
          ),
          const SizedBox(
            width: 8,
          ),
        ],
        Expanded(
          child: Text(
            text,
            style: textStyle,
          ),
        ),
        if (iconRight != null) ... [
          SvgPicture.asset(
            iconRight,
            color: iconColor,
            width: 16,
            height: 16,
          ),
        ],
      ],
    );
  }
}
