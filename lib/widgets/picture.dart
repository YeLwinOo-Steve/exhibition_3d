import 'dart:math';

import 'package:exhibition_3d/constants/color_constants.dart';
import 'package:exhibition_3d/constants/size_constants.dart';
import 'package:exhibition_3d/extensions/angle_ex.dart';
import 'package:flutter/material.dart';

import 'painting_shadow.dart';

class Picture extends StatelessWidget {
  const Picture({
    super.key,
    this.yDegree = .0,
    required this.width,
    required this.height,
    this.thickness = 10.0,
    required this.image,
  });
  final double yDegree;
  final double width;
  final double height;
  final double thickness;
  final AssetImage image;

  bool get isPositiveYDegree => yDegree >= .0;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..rotateX(90.0.degToRad)
        ..rotateY(yDegree.degToRad)
        ..translate(
          .0,
          -80.0,
        ),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: isPositiveYDegree
                ? AlignmentDirectional.topEnd
                : AlignmentDirectional.topStart,
            children: [
              Container(
                width: width,
                height: thickness,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: gradientColors,
                    stops: [0.1, 0.8, 1],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topLeft,
                  ),
                ),
                transform: Matrix4.identity()..rotateX(90.0.degToRad),
                alignment: Alignment.topLeft,
              ),
              if (isPositiveYDegree) ...[
                Container(
                  width: thickness,
                  height: height,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: gradientColors,
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                    ),
                  ),
                  transform: Matrix4.identity()
                    ..rotateY(-90.0.degToRad)
                    ..translate(.0, .0, -10),
                  alignment: Alignment.centerLeft,
                ),
              ],
              if (!isPositiveYDegree) ...[
                Container(
                  width: 10,
                  height: height,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: gradientColors,
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                    ),
                  ),
                  transform: Matrix4.identity()
                    ..rotateY(-90.0.degToRad)
                    ..translate(.0, .0),
                  alignment: Alignment.topLeft,
                ),
              ],
              Container(
                width: width,
                height: height,
                alignment: Alignment.center,
                color: lineColor,
                child: Center(
                  child: Container(
                    width: width - 10,
                    height: height - 10,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          verticalSpaceLarge,
          SizedBox(
            width: width,
            height: 4,
            child: CustomPaint(
              foregroundPainter: PaintingShadow(
                color: blackColor,
                blurSigma: 6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
