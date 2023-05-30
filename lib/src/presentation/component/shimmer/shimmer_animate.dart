import 'package:ekayanaarama/src/presentation/component/shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class ShimmerAnimate extends StatefulWidget {
  final Widget child;

  const ShimmerAnimate({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  _ShimmerAnimateState createState() => _ShimmerAnimateState();
}

class _ShimmerAnimateState extends State<ShimmerAnimate> {
  Listenable? _shimmerChanges;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _shimmerChanges?.removeListener(_onShimmerChange);
    _shimmerChanges = Shimmer.of(context)?.shimmerChanges;
    _shimmerChanges?.addListener(_onShimmerChange);
  }

  @override
  void dispose() {
    _shimmerChanges?.removeListener(_onShimmerChange);
    super.dispose();
  }

  void _onShimmerChange() {
    setState(() {
      // update the shimmer painting.
    });
  }

  @override
  Widget build(BuildContext context) {
    // Collect ancestor shimmer info.
    final shimmer = Shimmer.of(context);
    if (shimmer == null) return const SizedBox.shrink();
    if (!shimmer.isSized) {
      // The ancestor Shimmer widget has not laid
      // itself out yet. Return an empty box.
      return const SizedBox.shrink();
    }
    final shimmerSize = shimmer.size;
    final gradient = shimmer.gradient;
    final offsetWithinShimmer = shimmer.getDescendantOffset(
      descendant: context.findRenderObject() as RenderBox,
    );

    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (bounds) {
        return gradient.createShader(
          Rect.fromLTWH(
            -offsetWithinShimmer.dx,
            -offsetWithinShimmer.dy,
            shimmerSize.width,
            shimmerSize.height,
          ),
        );
      },
      child: widget.child,
    );
  }
}