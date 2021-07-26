import 'package:flutter/material.dart';

@immutable
class ShakeWidget extends StatelessWidget {
  const ShakeWidget({
    Key? key,
    this.duration = const Duration(milliseconds: 500),
    this.deltaX = 20,
    this.curve = Curves.bounceOut,
    required this.child,
  }) : super(key: key);

  final Duration duration;
  final double deltaX;
  final Widget child;
  final Curve curve;

  /// convert 0-1 to 0-1-0
  double shake(double animation) =>
      2 * (0.5 - (0.5 - curve.transform(animation)).abs());

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      key: key,
      tween: Tween<double>(begin: 0.0, end: 1.0),
      duration: duration,
      builder: (_, __, Widget? child) => Transform.translate(
        offset: Offset(deltaX * shake(__), 0),
        child: child,
      ),
      child: child,
    );
  }
}
