import 'dart:math';

import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late AnimationController controller1;
  late AnimationController controller2;
  late AnimationController controller3;
  late AnimationController controller4;
  late AnimationController iconController;
  late Animation animation;
  late Animation animation2;
  late Animation sizeAnimation;
  bool isSelected = false;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    controller1 =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    controller2 =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    controller3 =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    controller4 =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    iconController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    animation = Tween(
      begin: 0.0,
      end: 2 * pi,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.linear))
      ..addListener(() {
        setState(() {});
      });

    animation2 = Tween(
      begin: 2 * pi,
      end: 0.0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.linear))
      ..addListener(() {
        setState(() {});
      });
    controller.repeat();
    controller1.repeat();
    controller2.repeat();
    controller3.repeat();
    controller4.repeat();
    iconController.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animation Screen"),
      ),
      body: Center(
        child: SizedBox(
          height: 300,
          width: 300,
          child: Transform.rotate(
            angle: animation.value,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.rotate(
                  angle: animation2.value,
                  child: FlutterLogo(
                    duration: Duration(seconds: 2),
                    curve: Curves.linear,
                    size: 70,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform.rotate(
                      angle: animation2.value,
                      child: const FlutterLogo(
                        duration: Duration(seconds: 2),
                        curve: Curves.linear,
                        size: 70,
                      ),
                    ),
                    const SizedBox(
                      width: 70,
                    ),
                    Transform.rotate(
                      angle: animation2.value,
                      child: const FlutterLogo(
                        duration: Duration(seconds: 2),
                        curve: Curves.linear,
                        size: 70,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Transform.rotate(
                  angle: animation2.value,
                  child: FlutterLogo(
                    duration: Duration(seconds: 2),
                    curve: Curves.linear,
                    size: 70,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: AnimatedContainer(
            height: sizeAnimation.value,
            width: sizeAnimation.value,
            duration: const Duration(seconds: 2),
            curve: Curves.bounceIn,
            child: Icon(
              Icons.account_circle_outlined,
              color: Colors.white,
              size: sizeAnimation.value,
            ),
          ),
          onPressed: () {
            isSelected = !isSelected;
          }),
    );
  }
}
