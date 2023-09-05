import 'package:flutter/material.dart';
import 'package:practice/ui/custom_paint.dart';
import 'package:practice/ui/qorbola.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CustomPaintScreen()));
                },
                child: const Text("flag")),
          ),
          Center(
            child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => QorBola()));
                },
                child: const Text("qor bola")),
          )
        ],
      ),
    );
  }
}
