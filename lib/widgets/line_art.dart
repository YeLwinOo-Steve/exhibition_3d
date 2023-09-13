import 'package:flutter/material.dart';

class LineArt extends CustomPainter {
  final Color color;
  final double strokeWidth;
  LineArt({
    Key? key,
    required this.color,
    this.strokeWidth = 4.0,
  });
  @override
  void paint(Canvas canvas, Size size) {
    Path linePath = Path();
    linePath.moveTo(size.width * 0.01903764, size.height * 2);
    linePath.lineTo(size.width * 0.01903764, size.height * 0.7918350);
    linePath.cubicTo(
        size.width * 0.01903764,
        size.height * 0.7918350,
        size.width * 0.01452347,
        size.height * 0.7314297,
        size.width * 0.04126125,
        size.height * 0.7001855);
    linePath.cubicTo(
        size.width * 0.06799896,
        size.height * 0.6689414,
        size.width * 0.1110569,
        size.height * 0.6709668,
        size.width * 0.1110569,
        size.height * 0.6709668);
    linePath.lineTo(size.width * 0.8058889, size.height * 0.6709668);
    linePath.cubicTo(
        size.width * 0.8058889,
        size.height * 0.6709668,
        size.width * 0.8510347,
        size.height * 0.6621719,
        size.width * 0.8718681,
        size.height * 0.6283232);
    linePath.cubicTo(
        size.width * 0.8927014,
        size.height * 0.5944756,
        size.width * 0.8916597,
        size.height * 0.5319873,
        size.width * 0.8916597,
        size.height * 0.5319873);
    linePath.cubicTo(
        size.width * 0.8916597,
        size.height * 0.4095645,
        size.width * 0.8916597,
        size.height * 0.3206182,
        size.width * 0.8916597,
        size.height * 0.1981953);
    linePath.cubicTo(
        size.width * 0.8916597,
        size.height * 0.1981953,
        size.width * 0.8910486,
        size.height * 0.1685127,
        size.width * 0.9121458,
        size.height * 0.1398721);
    linePath.cubicTo(
        size.width * 0.9332431,
        size.height * 0.1112314,
        size.width * 0.9930556,
        size.height * 0.1221670,
        size.width * 0.9930556,
        size.height * 0.1221670);

    Paint linePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..color = color
      ..strokeCap = StrokeCap.round;
    canvas.drawPath(linePath, linePaint);

    Path heartPath = Path();
    heartPath.moveTo(size.width * 0.1666569, size.height * 0.6679688);
    heartPath.cubicTo(
        size.width * 0.1666569,
        size.height * 0.6679688,
        size.width * 0.1467438,
        size.height * 0.6459687,
        size.width * 0.1454590,
        size.height * 0.6389414);
    heartPath.cubicTo(
        size.width * 0.1441750,
        size.height * 0.6319141,
        size.width * 0.1465299,
        size.height * 0.6181641,
        size.width * 0.1565931,
        size.height * 0.6181641);
    heartPath.cubicTo(
        size.width * 0.1666569,
        size.height * 0.6181641,
        size.width * 0.1666569,
        size.height * 0.6297754,
        size.width * 0.1666569,
        size.height * 0.6297754);
    heartPath.cubicTo(
        size.width * 0.1666569,
        size.height * 0.6297754,
        size.width * 0.1655861,
        size.height * 0.6181641,
        size.width * 0.1758639,
        size.height * 0.6181641);
    heartPath.cubicTo(
        size.width * 0.1861410,
        size.height * 0.6181641,
        size.width * 0.1880681,
        size.height * 0.6319141,
        size.width * 0.1861410,
        size.height * 0.6389414);
    heartPath.cubicTo(
        size.width * 0.1842139,
        size.height * 0.6459687,
        size.width * 0.1666569,
        size.height * 0.6679688,
        size.width * 0.1666569,
        size.height * 0.6679688);
    heartPath.close();

    Paint heartPaint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = strokeWidth
      ..color = color
      ..strokeCap = StrokeCap.round;
    canvas.drawPath(heartPath, heartPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
