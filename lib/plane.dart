import 'dart:math';

import 'package:exhibition_3d/constants/size_constants.dart';
import 'package:exhibition_3d/state/mouse_postion_builder.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'widgets/painting_shadow.dart';

class Plane extends StatefulWidget {
  const Plane({super.key});

  @override
  State<Plane> createState() => _PlaneState();
}

class _PlaneState extends State<Plane> {
  late double _screenHeight;
  late double _screenWidth;
  ValueNotifier<double> dx = ValueNotifier<double>(45);
  ValueNotifier<double> dy = ValueNotifier<double>(-30);

  @override
  void dispose() {
    dx.dispose();
    dy.dispose();
    super.dispose();
  }

  void _onMouseMove(PointerEvent event) {
    Offset position = event.position;
    dy.value = ((position.dx / _screenWidth) * 10) - 30;
    dx.value = 45.0 - 20.0 * (position.dy / _screenHeight);
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
              // ..rotateZ(0.7),
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Transform(
                    transform: Matrix4.identity()..rotateX(90 * pi / 180),
                    // ..rotateY(20 * pi / 180),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 180,
                          height: 200,
                          decoration: const BoxDecoration(
                            color: Colors.teal,
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                offset: Offset(10, -8),
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                        verticalSpaceLarge,
                        SizedBox(
                          width: 180,
                          height: 4,
                          child: CustomPaint(
                            foregroundPainter: PaintingShadow(
                              color: Colors.black,
                              blurSigma: 6,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'I 💖 Yoh Yoh',
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        verticalSpaceMedium,
                        const SizedBox(
                          width: 300,
                          child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec iaculis tortor sit amet massa imperdiet luctus. Nulla maximus vulputate nisl in vulputate'),
                        ),
                        verticalSpaceSmall,
                        FilledButton(onPressed: () {}, child: Text('Love ya')),
                      ],
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
