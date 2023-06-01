import 'package:ekayanaarama/ekayana.dart';
import 'package:ekayanaarama/src/presentation/component/tap_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FilterActivityComponent extends StatelessWidget {
  final bool isSelected;
  final String category;
  final String icon;
  final VoidCallback? onTap;

  const FilterActivityComponent({
    Key? key,
    required this.category,
    required this.icon,
    this.isSelected = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          height: 88,
          width: 74,
          decoration: BoxDecoration(
            color: isSelected ? ColorToken.primary_500 : ColorToken.gray_0,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Tappable(
            onTap: onTap,
            borderRadius: BorderRadius.circular(8),
            child: Column(
              children: [
                const SizedBox(
                  height: 12,
                ),
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
                      color: isSelected
                          ? ColorToken.primary_500
                          : ColorToken.gray_200,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  category,
                  style: TypographyToken.textSmallSemiBold.apply(
                    color: isSelected ? ColorToken.white : ColorToken.black,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
