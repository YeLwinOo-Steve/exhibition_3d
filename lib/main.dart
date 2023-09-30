import 'package:exhibition_3d/constants/color_constants.dart';
import 'package:exhibition_3d/plane.dart';
import 'package:exhibition_3d/widgets/wave_painter.dart';
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: planeColor),
        scaffoldBackgroundColor: planeColor,
        useMaterial3: true,
      ),
      // home: Scaffold(body: Center(child: Gooey())),
      home: const Plane(),
    );
  }
}