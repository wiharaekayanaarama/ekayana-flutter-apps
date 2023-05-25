import 'package:ekayanaarama/ekayana.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBarComponent extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onNavigationTap;
  final String title;
  final String backIcon;

  const NavBarComponent({
    Key? key,
    required this.title,
    this.backIcon = Iconography.chevronLeft,
    this.onNavigationTap,
  }) : super(key: key);

  static const double defaultHeight = 54;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorToken.white,
      child: SafeArea(
        child: Stack(
          children: [
            if (onNavigationTap != null) ...[
              InkWell(
                onTap: onNavigationTap,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SvgPicture.asset(
                    backIcon,
                  ),
                ),
              ),
            ],
            Center(
              child: Text(title, style: TypographyToken.textLargeBold),
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(defaultHeight);
}
