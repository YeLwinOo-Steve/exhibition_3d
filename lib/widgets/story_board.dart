import 'package:exhibition_3d/constants/color_constants.dart';
import 'package:exhibition_3d/constants/size_constants.dart';
import 'package:flutter/material.dart';

class StoryBoard extends StatelessWidget {
  const StoryBoard({
    super.key,
    required this.width,
    required this.height,
    required this.onClose,
  });
  final double width;
  final double height;
  final VoidCallback onClose;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(30.0),
      decoration: const BoxDecoration(
        color: lineColor,
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: onClose,
              icon: const Icon(
                Icons.close,
                color: planeColor,
              ),
            ),
          ),
          Text('My Story'),
          verticalSpaceLarge,
          Text("Ya know, I'm a god!"),
        ],
      ),
    );
  }
}
