import 'package:ekayanaarama/ekayana.dart';
import 'package:flutter/material.dart';

enum PlaceholderType {
  circle,
  image,
  rectangle,
}

class PlaceholderComponent extends StatelessWidget {
  final PlaceholderType placeholderType;
  final double width;
  final double height;
  final BorderRadius? radius;
  final String image;
  final TextStyle? textStyle;
  final int lines;
  final Axis orientation;

  static const String _imageLoading = "asset/drawable/eka_deer.png";

  const PlaceholderComponent.circle({
    Key? key,
    required double size,
  })
      : placeholderType = PlaceholderType.circle,
        radius = null,
        image = "",
        textStyle = null,
        width = size,
        height = size,
        lines = 0,
        orientation = Axis.horizontal,
        super(key: key);

  const PlaceholderComponent.image({
    required this.width,
    required this.height,
    Key? key,
    this.image = _imageLoading,
    this.radius
  })
      : placeholderType = PlaceholderType.image,
        textStyle = null,
        lines = 0,
        orientation = Axis.horizontal,
        super(key: key);

  const PlaceholderComponent.rectangle({
    required this.width,
    required this.height,
    Key? key,
    this.radius
  })
      : placeholderType = PlaceholderType.rectangle,
        image = "",
        textStyle = null,
        lines = 0,
        orientation = Axis.horizontal,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (placeholderType) {
      case PlaceholderType.circle:
        return Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: ColorToken.gray_100,
          ),
        );
      case PlaceholderType.rectangle:
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: ColorToken.gray_100,
            borderRadius: radius,
          ),
        );
      case PlaceholderType.image:
        final imageRadius = radius ?? BorderRadius.zero;
        return ClipRRect(
            borderRadius: imageRadius,
            child: Image.asset(
              image,
              width: width,
              height: height,
              fit: BoxFit.scaleDown,
            )
        );
    }
  }
}
