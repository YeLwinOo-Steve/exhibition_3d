import 'dart:math';

import 'package:exhibition_3d/constants/asset_constants.dart';
import 'package:exhibition_3d/constants/color_constants.dart';
import 'package:exhibition_3d/constants/size_constants.dart';
import 'package:exhibition_3d/constants/value_constants.dart';
import 'package:exhibition_3d/state/mouse_postion_builder.dart';
import 'package:exhibition_3d/widgets/picture.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'constants/string_constants.dart';
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
  late AssetImage blossomImage;
  late AssetImage harvestImage;
  late AssetImage irisesImage;
  late AssetImage cypressesImage;

  @override
  void initState() {
    super.initState();
    blossomImage = const AssetImage(kaBlossom);
    harvestImage = const AssetImage(kaHarvest);
    irisesImage = const AssetImage(kaIrises);
    cypressesImage = const AssetImage(kaCypresses);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _precacheImages();
  }

  @override
  void dispose() {
    dx.dispose();
    dy.dispose();
    super.dispose();
  }

  void _precacheImages() {
    precacheImage(blossomImage, context);
    precacheImage(harvestImage, context);
    precacheImage(irisesImage, context);
    precacheImage(cypressesImage, context);
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
                      foregroundPainter: LineArt(color: lineColor),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          ksTitle,
                          style: kTitleTextStyle,
                        ),
                        verticalSpaceSmall,
                        SizedBox(
                          width: _screenWidth * 0.2,
                          child: const Text(
                            ksQuote,
                            style: kQuoteTextStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        verticalSpaceSmall,
                        FilledButton(
                          onPressed: () {},
                          child: const Text(ksExplore),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: _screenWidth * .25,
                    top: _screenHeight * .3,
                    child: Picture(
                      yDegree: 0,
                      width: 180,
                      height: 200,
                      image: blossomImage,
                    ),
                  ),
                  Positioned(
                    right: _screenWidth * 0.3,
                    top: _screenHeight * 0.2,
                    child: Picture(
                      yDegree: 0,
                      width: 180,
                      height: 200,
                      image: harvestImage,
                    ),
                  ),
                  Positioned(
                    right: _screenWidth * 0.3,
                    bottom: _screenHeight * .05,
                    child: Picture(
                      yDegree: 0,
                      width: 160,
                      height: 130,
                      image: irisesImage,
                    ),
                  ),
                  Positioned(
                    left: _screenWidth * 0.4,
                    bottom: _screenHeight * .05,
                    child: Picture(
                      yDegree: -90,
                      width: 160,
                      height: 130,
                      image: cypressesImage,
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
