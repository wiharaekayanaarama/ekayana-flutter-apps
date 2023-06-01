import 'package:cached_network_image/cached_network_image.dart';
import 'package:ekayanaarama/ekayana.dart';
import 'package:ekayanaarama/src/presentation/component/tap_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CollapsingNavBarComponent extends StatelessWidget {
  final String title;
  final String image;
  final Color backgroundColor;
  final double expandedHeight;
  final bool floating;
  final bool pinned;
  final double elevation;

  final VoidCallback? onNavigationTap;

  const CollapsingNavBarComponent({
    Key? key,
    required this.title,
    required this.image,
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
        // InkWell(
        //   onTap: onNavigationTap,
        //   child: SvgPicture.asset(Iconography.chevronLeft),
        // ),
        const Spacer(),
        Text(
          title,
          style: TypographyToken.textLargeBold.apply(
            color: ColorToken.black,
          ),
        ),
        const Spacer(),
      ],
    );
    return SliverAppBar(
      title: Tappable(
        onTap: onNavigationTap,
        borderRadius: BorderRadius.circular(100),
        child: SvgPicture.asset(Iconography.chevronLeft),
      ),
      expandedHeight: expandedHeight,
      backgroundColor: backgroundColor,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return FlexibleSpaceBar(
            background: CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.fill,
              placeholder: (_, __) => const ImageLoadPlaceholderComponent(),
            ),
            centerTitle: true,
            title: AnimatedOpacity(
              duration: const Duration(milliseconds: 100),
              opacity: constraints.biggest.height ==
                      MediaQuery.of(context).padding.top + kToolbarHeight
                  ? 1.0
                  : 0.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: content,
              ),
            ),
          );
        },
      ),
      automaticallyImplyLeading: false,
      floating: floating,
      pinned: pinned,
      elevation: elevation,
    );
  }
}
