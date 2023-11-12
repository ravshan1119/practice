import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:practice/ui/widgets/blobal_mini_button.dart';
import 'package:practice/ui/widgets/global_button.dart';
import 'package:practice/utils/images.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    final _controller = ValueNotifier<bool>(false);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GlobalButton(
                onTap: () {},
                color: const Color(0xFFFEBB1B),
                title: "Continue with Apple",
                radius: 100,
                textColor: const Color(0xff35383f),
                leftIcon: AppImages.bag,
                rightIcon: AppImages.bag,
                borderColor: Colors.black,
              ),
            ),
            AdvancedSwitch(
              controller: _controller,
              thumb: ValueListenableBuilder(
                valueListenable: _controller,
                builder: (_, value, __) {
                  return Icon(
                      value ? Icons.lightbulb : Icons.lightbulb_outline);
                },
              ),
            ),
            AdvancedSwitch(
              controller: _controller,
              activeColor: Colors.green,
              inactiveColor: Colors.grey,
              // activeChild: Text('ON'),
              // inactiveChild: Text('OFF'),
              // activeImage: AssetImage('assets/images/on.png'),
              // inactiveImage: AssetImage('assets/images/off.png'),
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              width: 44.0,
              height: 24.0,
              enabled: true,
              disabledOpacity: 0.5,
            ),
            const SizedBox(height: 30),
            GlobalMiniButton(
              onTap: () {},
              height: 70,
              width: 70,
              icon: AppImages.bag,
              radius: 100,
              color: Colors.teal,
            )
          ],
        ),
      ),
    );
  }
}
