import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'initial_animation/animation_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: (AnimationScreen()),
    );
  }
}
