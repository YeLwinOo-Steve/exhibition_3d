import 'package:exhibition_3d/constants/color_constants.dart';
import 'package:exhibition_3d/constants/size_constants.dart';
import 'package:flutter/material.dart';

import 'wave_painter.dart';

class StoryBoard extends StatefulWidget {
  const StoryBoard({
    super.key,
    this.isStoryOpen = false,
    required this.width,
    required this.height,
    required this.onClose,
  });
  final bool isStoryOpen;
  final double width;
  final double height;
  final VoidCallback onClose;

  @override
  State<StoryBoard> createState() => _StoryBoardState();
}

class _StoryBoardState extends State<StoryBoard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final double amplitude = 8;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
  }

  void waveListener() {
    if (widget.isStoryOpen) {
      _controller.repeat();
    } else {
      _controller.reset();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    waveListener();
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: WavePainter(
            _controller.value,
            amplitude,
            lineColor,
          ),
          child: child,
        );
      },
      child: Container(
        width: widget.width,
        padding: const EdgeInsets.only(
          top: 50.0,
          right: 50.0,
          bottom: 50.0,
        ),
        decoration: const BoxDecoration(
          color: lineColor,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: widget.onClose,
                icon: const Icon(
                  Icons.close,
                  color: planeColor,
                ),
              ),
            ),
            const Text(
              'My Story',
              style: TextStyle(
                color: planeColor,
                fontSize: 28,
                fontWeight: FontWeight.w900,
              ),
            ),
            verticalSpaceLarge,
            const Text("Ya know, Flutter sucks!"),
          ],
        ),
      ),
    );
  }
}
