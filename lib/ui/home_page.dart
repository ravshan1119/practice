import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/data/getx_controllers/counter_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    CounterController controller = Get.put(CounterController());
    print("Chizildi!");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Screen GetX"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Obx(() => Text(controller.counter.toString())),
          ],
        ),
      ),
      floatingActionButton: Row(
        children: [
          FloatingActionButton(onPressed: () {
            controller.increment();
          }, child: const Icon(Icons.add),),
          FloatingActionButton(onPressed: () {
            controller.decrement();
          }, child: const Icon(Icons.remove),),
          FloatingActionButton(onPressed: () {
            controller.reset();
          }, child: const Icon(Icons.refresh),),
        ],
      ),
    );
  }
}
