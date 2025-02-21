import 'package:cached_network_image/cached_network_image.dart';
import 'package:ekayanaarama/ekayana.dart';
import 'package:ekayanaarama/src/presentation/component/tap_container.dart';
import 'package:flutter/material.dart';

class EbookComponent extends StatelessWidget {
  final String title;
  final String publisher;
  final String coverUrl;
  final int viewCount;
  final VoidCallback? onTap;

  const EbookComponent({
    super.key,
    required this.title,
    required this.publisher,
    required this.coverUrl,
    required this.viewCount,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Tappable(
      onTap: () => onTap?.call(),
      borderRadius: BorderRadius.circular(4),
      child: Wrap(
        children: [
          Stack(
            children: [
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    height: 56,
                    width: 56,
                    decoration: BoxDecoration(
                      color: ColorToken.primary_50,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                      color: ColorToken.primary_50,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                bottom: 24,
                right: 8,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                      color: ColorToken.primary_50,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              ),
              AspectRatio(
                aspectRatio: 120 / 150,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: CachedNetworkImage(
                      imageUrl: coverUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, _) {
                        return const ImageLoadPlaceholderComponent();
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8,
              ),
              Text(
                title,
                style: TypographyToken.textSmallBold,
                maxLines: 2,
              ),
              Text(
                publisher,
                style: TypographyToken.textSmallRegular.apply(
                  color: ColorToken.gray_500,
                ),
                maxLines: 1,
              ),
              Text(
                "$viewCount Dilihat",
                style: TypographyToken.textSmallRegular.apply(
                  color: ColorToken.gray_500,
                ),
                maxLines: 1,
              ),
            ],
          )
        ],
      ),
    );
  }
}
