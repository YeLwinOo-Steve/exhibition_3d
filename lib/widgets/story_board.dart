import 'package:flutter/material.dart';

class StoryBoard extends StatelessWidget {
  const StoryBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Center(
        child: Text('Story board'),
      ),
    );
  }
}
