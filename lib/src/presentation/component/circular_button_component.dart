import 'package:ekayanaarama/ekayana.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CircularButtonComponent extends StatelessWidget {
  final VoidCallback? onPressed;
  final String icon;
  final EkaCircularButtonStyle style;

  static const double textButtonSize = 32;

  const CircularButtonComponent({
    Key? key,
    required this.icon,
    this.onPressed,
    this.style = EkaCircularButtonStyle.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: style.backgroundColor,
        minimumSize: const Size(textButtonSize, textButtonSize),
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        foregroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      child: SvgPicture.asset(
        icon,
        height: 16,
        width: 16,
        color: style.foregroundColor,
      ),
    );
  }
}

class EkaCircularButtonStyle {
  final Color backgroundColor;
  final Color foregroundColor;

  const EkaCircularButtonStyle({
    required this.backgroundColor,
    required this.foregroundColor,
  });

  static const white = EkaCircularButtonStyle(
    backgroundColor: ColorToken.white,
    foregroundColor: ColorToken.black,
  );

  static const black = EkaCircularButtonStyle(
    backgroundColor: ColorToken.black,
    foregroundColor: ColorToken.white,
  );
}
