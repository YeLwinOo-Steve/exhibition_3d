import 'package:flutter/material.dart';

class StoryBoardAnimator extends StatelessWidget {
  final Animation<double> controller;
  final Widget child;
  const StoryBoardAnimator({
    super.key,
    required this.controller,
    required this.child,
  });

  Animation<Offset> get rightSlideAnimation => Tween<Offset>(
        begin: const Offset(1, 0),
        end: const Offset(0, 0),
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Curves.fastEaseInToSlowEaseOut,
        ),
      );
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: rightSlideAnimation,
      child: child,
    );
  }
}
