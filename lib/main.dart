import 'package:exhibition_3d/constants/color_constants.dart';
import 'package:exhibition_3d/plane.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exhibition 3D',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: planeColor),
        scaffoldBackgroundColor: planeColor,
        useMaterial3: true,
      ),
      home: const Plane(),
    );
  }
}
