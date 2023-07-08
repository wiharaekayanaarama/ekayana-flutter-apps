import 'package:ekayanaarama/ekayana.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum ButtonVariant { text, icon }

class ButtonComponent extends StatelessWidget {
  final String? text;
  final String? iconLeft;
  final String? iconRight;
  final String? icon;
  final VoidCallback? onPressed;
  final EkaButtonStyle? style;
  final ButtonVariant variant;

  const ButtonComponent.text({
    Key? key,
    required this.text,
    this.iconLeft,
    this.iconRight,
    this.onPressed,
    this.style = EkaButtonStyle.primary,
  })  : icon = null,
        variant = ButtonVariant.text,
        super(key: key);

  const ButtonComponent.icon({
    Key? key,
    this.icon,
    this.onPressed,
    this.style = EkaButtonStyle.primary,
  })  : text = null,
        iconLeft = null,
        iconRight = null,
        variant = ButtonVariant.icon,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (variant == ButtonVariant.text) return textButton();
    return iconButton();
  }

  Widget textButton() {
    final iconLeft = this.iconLeft;
    final iconRight = this.iconRight;
    final outlineColor = style?.outlineColor;

    final content = Row(
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
          text ?? "",
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
    );

    if (outlineColor != null) {
      return OutlinedButton(
        onPressed: () {
          onPressed?.call();
        },
        style: OutlinedButton.styleFrom(
          primary: ColorToken.gray_700,
        ),
        child: content,
      );
    }
    return TextButton(
      onPressed: () {
        onPressed?.call();
      },
      style: TextButton.styleFrom(
        backgroundColor: style?.backgroundColor,
      ),
      child: content,
    );
  }

  Widget iconButton() {
    final outlineColor = style?.outlineColor;

    final content = SvgPicture.asset(
      Iconography.map_01,
      height: 16,
      width: 16,
      color: ColorToken.white,
    );

    if (outlineColor != null) {
      return OutlinedButton(
        onPressed: () {
          onPressed?.call();
        },
        style: OutlinedButton.styleFrom(
          primary: ColorToken.gray_700,
        ),
        child: content,
      );
    }
    return TextButton(
      onPressed: () {
        onPressed?.call();
      },
      style: TextButton.styleFrom(
        backgroundColor: style?.backgroundColor,
        fixedSize: const Size(32, 32),
        minimumSize: Size.zero,
      ),
      child: content,
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
