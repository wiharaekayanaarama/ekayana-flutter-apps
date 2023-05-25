import 'package:ekayanaarama/ekayana.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CircularButtonComponent extends StatelessWidget {
  final VoidCallback? onPressed;
  final String icon;

  static const double textButtonSize = 32;

  const CircularButtonComponent({
    Key? key,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: ColorToken.black,
        minimumSize: const Size(textButtonSize, textButtonSize),
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        primary: ColorToken.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      child: SvgPicture.asset(
        icon,
        height: 16,
        width: 16,
        color: ColorToken.white,
      ),
    );
  }
}
