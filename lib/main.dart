import 'package:flutter/material.dart';
import 'package:practice/ui/detail_page.dart';
import 'package:practice/ui/home_page.dart';
import 'package:practice/ui/test_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
