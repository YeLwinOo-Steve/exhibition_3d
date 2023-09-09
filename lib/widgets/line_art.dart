import 'package:flutter/material.dart';

class LineArt extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.teal
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;
    Path path = Path();
    path.moveTo(0, size.height);
    path.cubicTo(size.width / 4, 3 * size.height / 4, 3 * size.width / 4,
        size.height / 4, size.width, size.height);
    canvas.drawPath(path, paint);
    // canvas.drawLine(Offset(0, size.height * 0.7),
    //     Offset(size.width, size.height * 0.7), paint);

    // canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
