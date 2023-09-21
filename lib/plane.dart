import 'dart:math';

import 'package:exhibition_3d/constants/asset_constants.dart';
import 'package:exhibition_3d/constants/color_constants.dart';
import 'package:exhibition_3d/constants/size_constants.dart';
import 'package:exhibition_3d/constants/value_constants.dart';
import 'package:exhibition_3d/state/mouse_postion_builder.dart';
import 'package:exhibition_3d/widgets/picture.dart';
import 'package:exhibition_3d/widgets/story_board.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'constants/string_constants.dart';
import 'domain_model/story.dart';
import 'widgets/animated_transform.dart';
import 'widgets/line_art.dart';
import 'widgets/painting_shadow.dart';
import 'widgets/story_board_animator.dart';

class Plane extends StatefulWidget {
  const Plane({super.key});

  @override
  State<Plane> createState() => _PlaneState();
}

class _PlaneState extends State<Plane> with TickerProviderStateMixin {
  late double _screenHeight;
  late double _screenWidth;
  late AnimationController animationController;
  late AnimationController dzAnimationController;
  late Animation<double> planeYAnimation;
  Story? story;

  double dxVal = 55;
  double dzVal = -50;
  bool isMouseEnabled = true;

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
        vsync: this, duration: const Duration(milliseconds: 1000))
      ..addStatusListener(
        animationStatusListener,
      );
    dzAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000))
      ..addStatusListener(dzStatusListener);
  }

  void animationStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.dismissed) {
      dzAnimationController.reverse();
    }
  }

  void dzStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      animationController.forward();
    }
    if (status == AnimationStatus.dismissed && !isMouseEnabled) {
      setState(() {
        isMouseEnabled = true;
      });
    } else if(isMouseEnabled){
      setState(() {
        isMouseEnabled = false;
      });
    }
  }

  bool get isAnimationCompleted =>
      animationController.status == AnimationStatus.completed;
  bool get isAnimationDismissed =>
      animationController.status == AnimationStatus.dismissed;
  bool get isDzAnimationControllerDismissed =>
      dzAnimationController.status == AnimationStatus.dismissed;
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
    dzAnimationController.dispose();
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
    dz.value = ((position.dx / _screenWidth) * 5) - 50;
    dx.value = 55.0 - 5.0 * (position.dy / _screenHeight);
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
                onHover: isMouseEnabled ? _onMouseMove : (_) {},
                child: AnimatedTransform(
                  animation: dzAnimationController.view,
                  initialDxVal: dxVal,
                  initialDzVal: dzVal,
                  dx: dx.value,
                  dz: dz.value,
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
            child: StoryBoardAnimator(
              controller: animationController.view,
              child: StoryBoard(
                width: _screenWidth * 0.3,
                height: double.infinity,
                onClose: toggleStory,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void toggleStory() {
    if (animationController.isDismissed) {
      dzAnimationController.forward();
    } else {
      animationController.reverse();
    }
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
