import 'package:ekayanaarama/ekayana.dart';
import 'package:ekayanaarama/src/presentation/component/tap_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBarComponent extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onNavigationTap;
  final VoidCallback? onMenuTap;
  final String title;
  final String backIcon;
  final String? menuIcon;

  const NavBarComponent({
    Key? key,
    required this.title,
    this.backIcon = Iconography.chevronLeft,
    this.onNavigationTap,
    this.menuIcon,
    this.onMenuTap,
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
              Tappable(
                onTap: onNavigationTap,
                borderRadius: BorderRadius.circular(100),
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
            ),
            if (menuIcon != null) ...[
              Align(
                alignment: Alignment.centerRight,
                child: Tappable(
                  onTap: onMenuTap,
                  borderRadius: BorderRadius.circular(100),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SvgPicture.asset(
                      menuIcon!,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(defaultHeight);
}
