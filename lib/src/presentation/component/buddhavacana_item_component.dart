import 'package:ekayanaarama/ekayana.dart';
import 'package:ekayanaarama/src/presentation/component/tap_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuddhavacanaItemComponent extends StatelessWidget {
  final String number;
  final String title;
  final String description;
  final VoidCallback? onTap;

  const BuddhavacanaItemComponent({
    Key? key,
    required this.number,
    required this.title,
    required this.description,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      color: ColorToken.white,
      child: Tappable(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$number.",
                style: TypographyToken.textSmallBold.apply(
                  color: ColorToken.gray_500
                ),
              ),
              const SizedBox(
                width: 14,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TypographyToken.textMediumSemiBold,
                    ),
                    Text(
                      description.replaceAll("<br />", ""),
                      style: TypographyToken.textSmallRegular.apply(
                        color: ColorToken.gray_400,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 14,
              ),
              Center(
                child: SvgPicture.asset(
                  Iconography.chevronRight,
                  color: ColorToken.primary_500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
