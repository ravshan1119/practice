import 'package:flutter/material.dart';
import 'package:practice/ui/custom_paint.dart';
import 'package:practice/ui/home.dart';
import 'package:practice/ui/home_page.dart';
import 'package:practice/utils/flutter_utils/9.flutter_blur_effect.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlutterBlurEffectView(),
    );
  }
}
