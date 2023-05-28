import 'package:ekayanaarama/ekayana.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ButtonComponent extends StatelessWidget {
  final String text;
  final String? iconLeft;
  final String? iconRight;
  final VoidCallback? onPressed;
  final EkaButtonStyle? style;

  const ButtonComponent({
    Key? key,
    required this.text,
    this.iconLeft,
    this.iconRight,
    this.onPressed,
    this.style = EkaButtonStyle.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final iconLeft = this.iconLeft;
    final iconRight = this.iconRight;
    final outlineColor = style?.outlineColor;

    if (outlineColor != null) {
      return OutlinedButton(
        onPressed: () {
          onPressed?.call();
        },
        style: OutlinedButton.styleFrom(
          primary: ColorToken.gray_700,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconLeft != null) ...[
              SvgPicture.asset(
                iconLeft,
                height: 20,
                width: 20,
                color: style?.foregroundColor,
              ),
            ],
            const SizedBox(
              width: 6,
            ),
            Text(
              text,
              style: TypographyToken.textMediumBold.apply(
                color: style?.foregroundColor,
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            if (iconRight != null) ...[
              SvgPicture.asset(
                iconRight,
                height: 20,
                width: 20,
                color: style?.foregroundColor,
              ),
            ]
          ],
        ),
      );
    }
    return TextButton(
      onPressed: () {
        onPressed?.call();
      },
      style: TextButton.styleFrom(
        backgroundColor: style?.backgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (iconLeft != null) ...[
            SvgPicture.asset(
              iconLeft,
              height: 20,
              width: 20,
              color: style?.foregroundColor,
            ),
          ],
          const SizedBox(
            width: 6,
          ),
          Text(
            text,
            style: TypographyToken.textMediumBold.apply(
              color: style?.foregroundColor,
            ),
          ),
          const SizedBox(
            width: 6,
          ),
          if (iconRight != null) ...[
            SvgPicture.asset(
              iconRight,
              height: 20,
              width: 20,
              color: style?.foregroundColor,
            ),
          ]
        ],
      ),
    );
  }
}

class EkaButtonStyle {
  final Color backgroundColor;
  final Color foregroundColor;
  final Color? outlineColor;

  const EkaButtonStyle({
    required this.backgroundColor,
    required this.foregroundColor,
    this.outlineColor,
  });

  static const primary = EkaButtonStyle(
    backgroundColor: ColorToken.primary_500,
    foregroundColor: ColorToken.white,
  );

  static const outline = EkaButtonStyle(
    backgroundColor: ColorToken.white,
    foregroundColor: ColorToken.primary_500,
    outlineColor: ColorToken.primary_500,
  );

  static const naked = EkaButtonStyle(
    backgroundColor: Colors.transparent,
    foregroundColor: ColorToken.primary_500,
  );
}