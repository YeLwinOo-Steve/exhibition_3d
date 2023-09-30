import 'dart:math';

import 'package:flutter/material.dart';

class WavePainter extends CustomPainter {
  final double animationValue;
  final double amplitude;
  final Color color;
  WavePainter(
    this.animationValue,
    this.amplitude,
    this.color,
  );

  @override
  void paint(Canvas canvas, Size s) {
    Size size = Size(50, s.height);
    final paint = Paint()
      ..color = color // Wave color
      ..style = PaintingStyle.fill;

    final path = Path();

    const waveFrequency = 10.0; // Adjust the frequency of waves
    path.moveTo(size.width, 0);
    for (double y = 0; y < size.height; y += 50) {
      final x = (sin((y / size.height * waveFrequency * 2 * pi) +
                  (animationValue * 2 * pi)) *
              amplitude) -
          size.width;

      path.lineTo(x, (y + 50 > size.height) ? size.height : y);
    }

    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
