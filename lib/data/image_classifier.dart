// import 'dart:io';
// import 'package:image/image.dart' as img;
// import 'package:tflite_flutter/tflite_flutter.dart';
//
// class ImageClassifier {
//   Interpreter _interpreter;
//
//   ImageClassifier() {
//     loadModel();
//   }
//
//   void loadModel() async {
//     final interpreterOptions = InterpreterOptions();
//     _interpreter = await Interpreter.fromAsset('model.tflite', options: interpreterOptions);
//   }
//
//   Future<String> classifyImage(File image) async {
//     final inputImage = img.decodeImage(image.readAsBytesSync());
//     final inputBuffer = inputImage.toByteData();
//     final outputBuffer = List.filled(1 * 1000, 0).buffer.asUint8List();
//
//     await _interpreter.run(inputBuffer.buffer.asUint8List(), outputBuffer);
//
//     final labels = await File('labels.txt').readAsLines();
//     final output = outputBuffer.buffer.asFloat32List();
//     final maxIndex = output.indexOf(output.reduce(max));
//     final label = labels[maxIndex];
//
//     return label;
//   }
// }