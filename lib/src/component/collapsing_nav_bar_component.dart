import 'package:ekayanaarama/ekayana.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CollapsingNavBarComponent extends StatelessWidget {
  final String title;
  final Widget? flexibleSpace;
  final Color backgroundColor;
  final double expandedHeight;
  final bool floating;
  final bool pinned;
  final double elevation;

  final VoidCallback? onNavigationTap;

  const CollapsingNavBarComponent({
    Key? key,
    required this.title,
    this.flexibleSpace,
    this.backgroundColor = ColorToken.white,
    this.expandedHeight = 250,
    this.floating = false,
    this.pinned = true,
    this.elevation = 0,
    this.onNavigationTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final content = Row(
      children: [
        InkWell(
          onTap: onNavigationTap,
          child: SvgPicture.asset(
            Iconography.chevronLeft
          ),
        ),
        const Spacer(),
        // Text(title, style: TypographyToken.textLargeBold.apply(
        //   color: ColorToken.black
        // )),
        const Spacer(),
      ],
    );
    return SliverAppBar(
      title: content,
      expandedHeight: expandedHeight,
      backgroundColor: backgroundColor,
      flexibleSpace: flexibleSpace,
      automaticallyImplyLeading: false,
      floating: floating,
      pinned: pinned,
      elevation: elevation,
    );
  }
}
