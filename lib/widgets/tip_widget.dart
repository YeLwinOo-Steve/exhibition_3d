import 'package:flutter/material.dart';

import '../constants/size_constants.dart';
import '../constants/value_constants.dart';

class TipWidget extends StatelessWidget {
  const TipWidget({
    super.key,
    required this.vPadding,
    required this.title,
    required this.description,
    required this.animation,
    required this.index,
    required this.length,
  });
  final int index;
  final int length;
  final double vPadding;
  final String title;
  final String description;
  final Animation<double> animation;
  double get startInterval => index / length.toDouble();
  double get endInterval => (index + 1) / length.toDouble();
  Animation<Offset> get animationTween =>
      Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero).animate(
        CurvedAnimation(
          curve: Interval(
            startInterval,
            endInterval,
            curve: Curves.easeInOut,
          ),
          parent: animation,
        ),
      );
  Animation<double> get opacityTween => Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(
        CurvedAnimation(
          parent: animation,
          curve: Interval(
            startInterval,
            endInterval,
            curve: Curves.easeInOut,
          ),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animationTween,
      child: FadeTransition(
        opacity: opacityTween,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: vPadding,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                      text: "[ $title ]".toUpperCase(),
                      style: kTipTitleTextStyle,
                      children: [
                        TextSpan(
                          text: "\t\t\t$description",
                          style: kTipBodyTextStyle,
                        )
                      ]),
                ),
                verticalSpaceLarge,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
