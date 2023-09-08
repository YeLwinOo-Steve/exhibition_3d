import 'dart:math';

import 'package:flutter/material.dart';

class PaintingShadow extends CustomPainter {
  final Color color;
  final double blurSigma;
  PaintingShadow({
    required this.color,
    this.blurSigma = 0.0,
  });
  @override
  void paint(Canvas canvas, Size size) {
    Paint oval = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, blurSigma);
    canvas.drawOval(
        Rect.fromCenter(
          center: Offset(size.width / 2, size.height / 2),
          width: size.width,
          height: size.height,
        ),
        oval);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
