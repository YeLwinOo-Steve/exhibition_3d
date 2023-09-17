import 'package:flutter/material.dart';

class StoryBoardAnimator extends AnimatedWidget {
  final Animation<double> controller;
  final Widget child;
  final double width;
  final double height;
  const StoryBoardAnimator({
    super.key,
    required this.controller,
    required this.child,
    required this.width,
    required this.height,
  }) : super(
          listenable: controller,
        );

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
