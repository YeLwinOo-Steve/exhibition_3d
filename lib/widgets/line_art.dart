import 'package:flutter/material.dart';

class LineArt extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.teal
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;

    canvas.drawLine(Offset(0, size.height * 0.7),
        Offset(size.width, size.height * 0.7), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
