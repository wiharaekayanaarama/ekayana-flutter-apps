import 'package:ekayanaarama/ekayana.dart';
import 'package:ekayanaarama/src/presentation/component/tap_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AboutItemComponent extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const AboutItemComponent({
    Key? key,
    required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Tappable(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  text,
                  style: TypographyToken.textMediumSemiBold
                ),
              ),
              SvgPicture.asset(
                Iconography.chevronRight,
                color: ColorToken.primary_500,
                width: 16,
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
