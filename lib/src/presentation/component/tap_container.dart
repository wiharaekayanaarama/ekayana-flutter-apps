import 'package:flutter/material.dart';

enum TapEffect {
  ripple,
  rippleOnly,
  rippleBorderless,
  rippleBorderlessOnly,
  none
}

class Tappable extends StatelessWidget {
  final Widget? child;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onDoubleTap;
  final GestureLongPressCallback? onLongPress;
  final TapEffect tapEffect;
  final BorderRadius? borderRadius;

  const Tappable({
    Key? key,
    this.tapEffect = TapEffect.ripple,
    this.child,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ink = _getInk();
    if (tapEffect == TapEffect.ripple
        || tapEffect == TapEffect.rippleBorderless) {
      return Material(
        type: MaterialType.transparency,
        child: ink,
      );
    }
    return ink;
  }

  Widget _getInk() {
    if (tapEffect == TapEffect.rippleBorderless
        || tapEffect == TapEffect.rippleBorderlessOnly) {
      return InkResponse(
        onTap: _onTap,
        onDoubleTap: _onDoubleTap,
        onLongPress: _onLongPress,
        child: child,
      );
    }
    return InkWell(
      borderRadius: borderRadius,
      onTap: _onTap,
      onDoubleTap: _onDoubleTap,
      onLongPress: _onLongPress,
      child: child,
    );
  }

  GestureTapCallback? get _onTap => onTap != null ? _tap : null;

  GestureTapCallback? get _onDoubleTap => onDoubleTap != null ? _doubleTap : null;

  GestureLongPressCallback? get _onLongPress => onLongPress != null ? _longPress : null;

  void _tap() {
    onTap?.call();
  }

  void _doubleTap() {
    onDoubleTap?.call();
  }

  void _longPress() {
    onLongPress?.call();
  }
}
