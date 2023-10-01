import 'package:flutter/material.dart';

class AnimatedDottedLine extends StatefulWidget {
  const AnimatedDottedLine({super.key});

  @override
  _AnimatedDottedLineState createState() => _AnimatedDottedLineState();
}

class _AnimatedDottedLineState extends State<AnimatedDottedLine>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Adjust the duration as needed
    );

    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DottedLinePainter(animation: _animation),
    );
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
          Offset(dotPosition + 4, 0),
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
