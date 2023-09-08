import 'package:exhibition_3d/constants/color_constants.dart';
import 'package:exhibition_3d/plane.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exhibition 3D',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: planeColor),
        scaffoldBackgroundColor: planeColor,
        useMaterial3: true,
      ),
      home: const Plane(),
    );
  }
}