import 'package:flutter/material.dart';

class AnimatedDottedLine extends StatelessWidget {
  const AnimatedDottedLine({
    super.key,
    required this.dottedLineAnimation,
    required this.width,
    required this.height,
  });
  final double width;
  final double height;
  final Animation<double> dottedLineAnimation;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: dottedLineAnimation,
        builder: (controller, child) {
          return CustomPaint(
            size: Size(
              width,
              height,
            ),
            painter: DottedLinePainter(
              animation: dottedLineAnimation,
            ),
          );
        });
  }
}

class DottedLinePainter extends CustomPainter {
  final Animation<double> animation;

  DottedLinePainter({required this.animation}) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;
    const double dotSpacing = 10.0; // dot width = 4, spacing = 6
    final double totalWidth = size.width;
    final int numDots = (totalWidth / dotSpacing).ceil();

    for (int i = 0; i < numDots; i++) {
      final double progress = i / numDots;
      final double dotPosition = totalWidth * progress;

      if (dotPosition <= animation.value * totalWidth) {
        canvas.drawLine(
          Offset(dotPosition, 0),
          Offset(dotPosition + 3, 0),
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
