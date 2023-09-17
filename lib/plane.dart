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
import 'domain_model/story.dart';
import 'widgets/line_art.dart';
import 'widgets/painting_shadow.dart';

class Plane extends StatefulWidget {
  const Plane({super.key});

  @override
  State<Plane> createState() => _PlaneState();
}

class _PlaneState extends State<Plane> with SingleTickerProviderStateMixin {
  late double _screenHeight;
  late double _screenWidth;
  late AnimationController animationController;
  late Animation<double> planeYAnimation;
  Story? story;

  double dxVal = 55;
  double dyVal = -50;

  ValueNotifier<double> dx = ValueNotifier<double>(55);
  ValueNotifier<double> dz = ValueNotifier<double>(-50);
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
    animationController = AnimationController(
        vsync: this, duration: const Duration(microseconds: 1000));
    planeYAnimation = Tween<double>(begin: dyVal, end: .0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  bool get isYAnimationCompleted =>
      animationController.status == AnimationStatus.completed;
  bool get isYAnimationDismissed =>
      animationController.status == AnimationStatus.dismissed;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _precacheImages();
  }

  @override
  void dispose() {
    dx.dispose();
    dz.dispose();
    animationController.dispose();
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
    dz.value = ((position.dx / _screenWidth) * 10) - 50;
    dx.value = 55.0 - 10.0 * (position.dy / _screenHeight);
  }

  @override
  Widget build(BuildContext context) {
    _screenHeight = MediaQuery.sizeOf(context).height;
    _screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Stack(
        children: [
          MousePositionBuilder<double, double>(
            x: dx,
            y: dz,
            builder: (context, x, y) {
              return MouseRegion(
                onHover: isYAnimationDismissed ? _onMouseMove : null,
                child: Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, .001)
                    ..rotateX(
                      - dx.value * pi / 180,
                    )
                    ..rotateZ(
                      -dz.value * pi / 180,
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
                              width: _screenWidth * .2,
                              child: const Text(
                                ksQuote,
                                style: kQuoteTextStyle,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            verticalSpaceSmall,
                            FilledButton(
                              onPressed: toggleStory,
                              child: const Text(ksExplore),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: _screenWidth * .25,
                        top: _screenHeight * .3,
                        child: Picture(
                          key: const ValueKey(picture1),
                          yDegree: 0,
                          width: 180,
                          height: 200,
                          image: blossomImage,
                          // onPictureHover: _selectStory,
                        ),
                      ),
                      Positioned(
                        right: _screenWidth * .3,
                        top: _screenHeight * .2,
                        child: Picture(
                          key: const ValueKey(picture2),
                          yDegree: 0,
                          width: 180,
                          height: 200,
                          image: harvestImage,
                          // onPictureHover: _selectStory,
                        ),
                      ),
                      Positioned(
                        right: _screenWidth * .3,
                        bottom: _screenHeight * .05,
                        child: Picture(
                          key: const ValueKey(picture3),
                          yDegree: 0,
                          width: 160,
                          height: 130,
                          image: irisesImage,
                          // onPictureHover: _selectStory,
                        ),
                      ),
                      Positioned(
                        left: _screenWidth * .4,
                        bottom: _screenHeight * .05,
                        child: Picture(
                          key: const ValueKey(picture4),
                          yDegree: -90,
                          width: 160,
                          height: 130,
                          image: cypressesImage,
                          // onPictureHover: _selectStory,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Visibility(
              visible: story != null,
              child: Container(
                width: _screenWidth * 0.3,
                height: _screenHeight * 0.9,
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                color: blackColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void toggleStory() {

  }

  void _selectStory(String key) {
    if (key.contains(picture1)) {
      story = stories[picture1];
    } else if (key.contains(picture2)) {
      story = stories[picture1];
    } else if (key.contains(picture3)) {
      story = stories[picture1];
    } else if (key.contains(picture4)) {
      story = stories[picture1];
    } else {
      story = null;
    }
    setState(() {});
  }
}
