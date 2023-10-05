import 'package:exhibition_3d/constants/color_constants.dart';
import 'package:exhibition_3d/constants/size_constants.dart';
import 'package:flutter/material.dart';

import 'dotted_line.dart';
import 'wave_painter.dart';

class StoryBoard extends StatefulWidget {
  const StoryBoard({
    super.key,
    this.isStoryOpen = false,
    required this.animation,
    required this.width,
    required this.height,
    required this.onClose,
  });
  final bool isStoryOpen;
  final double width, height;
  final VoidCallback onClose;
  final Animation<double> animation;

  @override
  State<StoryBoard> createState() => _StoryBoardState();
}

class _StoryBoardState extends State<StoryBoard>
    with TickerProviderStateMixin {
  late AnimationController _storyBoardController;
  late AnimationController _dottedLineController;
  late Animation<double> _dottedLineAnimation;
  final double amplitude = 8;

  @override
  void initState() {
    super.initState();
    _storyBoardController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _storyBoardController.addStatusListener(controllerListener);
    _dottedLineController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _dottedLineAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
        parent: _dottedLineController, curve: Curves.easeInOut));
  }

  void controllerListener(AnimationStatus status) {
    if (status == AnimationStatus.forward) {
      // Start the animation
      _dottedLineController.forward();
    }else if(status == AnimationStatus.reverse){
      _dottedLineController.reverse();
    }
  }

  void waveListener() {
    if (widget.isStoryOpen) {
      _storyBoardController.repeat();
    } else {
      _storyBoardController.reset();
    }
  }

  @override
  void dispose() {
    _storyBoardController.dispose();
    _dottedLineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    waveListener();
    return AnimatedBuilder(
      animation: _storyBoardController,
      builder: (context, child) {
        return CustomPaint(
          painter: WavePainter(
            _storyBoardController.value,
            amplitude,
            lineColor,
          ),
          child: child,
        );
      },
      child: Container(
        width: widget.width,
        padding: const EdgeInsets.only(
          top: 20.0,
          right: 20.0,
          bottom: 20.0,
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
              "Van Gogh's Merciless Life",
              style: TextStyle(
                color: planeColor,
                fontSize: 28,
                fontWeight: FontWeight.w900,
              ),
            ),
            verticalSpaceLarge,
            const Text("Ya know, Flutter sucks!"),
            verticalSpaceExtreme,
            AnimatedDottedLine(
              dottedLineAnimation: _dottedLineAnimation,
            ),
          ],
        ),
      ),
    );
  }
}
