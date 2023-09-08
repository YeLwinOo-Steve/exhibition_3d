import 'dart:math';

import 'package:exhibition_3d/constants/size_constants.dart';
import 'package:exhibition_3d/state/mouse_postion_builder.dart';
import 'package:exhibition_3d/widgets/picture.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'widgets/line_art.dart';
import 'widgets/painting_shadow.dart';

class Plane extends StatefulWidget {
  const Plane({super.key});

  @override
  State<Plane> createState() => _PlaneState();
}

class _PlaneState extends State<Plane> {
  late double _screenHeight;
  late double _screenWidth;
  ValueNotifier<double> dx = ValueNotifier<double>(55);
  ValueNotifier<double> dy = ValueNotifier<double>(-50);

  @override
  void dispose() {
    dx.dispose();
    dy.dispose();
    super.dispose();
  }

  void _onMouseMove(PointerEvent event) {
    Offset position = event.position;
    dy.value = ((position.dx / _screenWidth) * 10) - 50;
    dx.value = 55.0 - 10.0 * (position.dy / _screenHeight);
  }

  @override
  Widget build(BuildContext context) {
    _screenHeight = MediaQuery.sizeOf(context).height;
    _screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: MousePositionBuilder<double, double>(
        x: dx,
        y: dy,
        builder: (context, x, y) {
          return MouseRegion(
            onHover: _onMouseMove,
            child: Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateX(
                  -dx.value * pi / 180,
                )
                ..rotateZ(
                  -dy.value * pi / 180,
                ),
              alignment: Alignment.center,
              child: Stack(
                children: [
                  SizedBox(
                    width: _screenWidth,
                    height: _screenHeight,
                    child: CustomPaint(
                      painter: LineArt(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'The Letter',
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        verticalSpaceMedium,
                        const SizedBox(
                          width: 200,
                          child: Text("something in the way yeah yeah yeah!!"),
                        ),
                        verticalSpaceSmall,
                        FilledButton(
                            onPressed: () {},
                            child: const Text('Explore Story')),
                      ],
                    ),
                  ),
                  Positioned(
                    left: _screenWidth * .25,
                    top: _screenHeight * .3,
                    child: const Picture(
                      yDegree: 0,
                      width: 180,
                      height: 200,
                    ),
                  ),
                  Positioned(
                    right: _screenWidth * 0.3,
                    top: _screenHeight * 0.2,
                    child: const Picture(
                      yDegree: 0,
                      width: 180,
                      height: 200,
                    ),
                  ),
                  Positioned(
                    right: _screenWidth * 0.3,
                    bottom: _screenHeight * .05,
                    child: const Picture(
                      yDegree: 0,
                      width: 160,
                      height: 130,
                    ),
                  ),
                  Positioned(
                    left: _screenWidth * 0.4,
                    bottom: _screenHeight * .05,
                    child: const Picture(
                      yDegree: -90,
                      width: 160,
                      height: 130,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
