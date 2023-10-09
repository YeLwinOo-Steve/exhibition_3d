import 'dart:math';

import 'package:flutter/cupertino.dart';

class AnimatedTransform extends AnimatedWidget {
  const AnimatedTransform({
    super.key,
    required this.initialDzVal,
    required this.initialDxVal,
    required this.dx,
    required this.dz,
    required this.animation,
    required this.child,
  }) : super(
          listenable: animation,
        );
  final double initialDzVal;
  final double initialDxVal;
  final double dx;
  final double dz;
  final Animation<double> animation;
  final Widget child;

  Animation<double> get xAnimation =>
      Tween<double>(begin: initialDxVal, end: .0).animate(
        curveAnimation,
      );

  Animation<double> get zAnimation =>
      Tween<double>(begin: initialDzVal, end: .0).animate(
        curveAnimation,
      );

  Animation<double> get curveAnimation => CurvedAnimation(
        parent: animation,
        curve: Curves.linearToEaseOut,
      );
  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, .001)
        ..rotateX(
          animation.isDismissed ? -dx * pi / 180 : -xAnimation.value * pi / 180,
        )
        ..rotateZ(
          animation.isDismissed ? -dz * pi / 180 : -zAnimation.value * pi / 180,
        ),
      alignment: Alignment.center,
      child: child,
    );
  }
}
