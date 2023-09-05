import 'dart:math';

import 'package:flutter/material.dart';

class CustomPaintScreen extends StatefulWidget {
  const CustomPaintScreen({Key? key}) : super(key: key);

  @override
  State<CustomPaintScreen> createState() => _CustomPaintScreenState();
}

class _CustomPaintScreenState extends State<CustomPaintScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Flag of Uzbekistan"),
      ),
      body: Container(
        width: double.infinity,
        height: 445,
        color: Colors.blue,
        child: Column(
          children: [
            Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      // color: Colors.white,
                      child: CustomPaint(
                        size: const Size(80, 80),
                        painter: MyPainterMoon(),
                      ),
                    ),

                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomPaint(
                              size: const Size(160, 160),
                              painter: MyPainter(),
                              child: Center(
                                child: Container(
                                  // color: Colors.orange,

                                  width: 20,
                                  height: 20,
                                  // color: Colors.yellow,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            CustomPaint(
                              size: const Size(160, 160),
                              painter: MyPainter(),
                              child: Center(
                                child: Container(
                                  // color: Colors.orange,
                                  width: 20,
                                  height: 20,
                                  // color: Colors.yellow,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            CustomPaint(
                              size: const Size(160, 160),
                              painter: MyPainter(),
                              child: Center(
                                child: Container(
                                  // color: Colors.orange,

                                  width: 20,
                                  height: 20,
                                  // color: Colors.yellow,
                                ),
                              ),
                            ),
                            const SizedBox(width: 100),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomPaint(
                              size: const Size(160, 160),
                              painter: MyPainter(),
                              child: Center(
                                child: Container(
                                  // color: Colors.orange,

                                  width: 20,
                                  height: 20,
                                  // color: Colors.yellow,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),

                            CustomPaint(
                              size: const Size(160, 160),
                              painter: MyPainter(),
                              child: Center(
                                child: Container(
                                  // color: Colors.orange,

                                  width: 20,
                                  height: 20,
                                  // color: Colors.yellow,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            CustomPaint(
                              size: const Size(160, 160),
                              painter: MyPainter(),
                              child: Center(
                                child: Container(
                                  // color: Colors.orange,
                                  width: 20,
                                  height: 20,
                                  // color: Colors.yellow,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            CustomPaint(
                              size: const Size(160, 160),
                              painter: MyPainter(),
                              child: Center(
                                child: Container(
                                  // color: Colors.orange,

                                  width: 20,
                                  height: 20,
                                  // color: Colors.yellow,
                                ),
                              ),
                            ),
                            const SizedBox(width: 100),

                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomPaint(
                              size: const Size(160, 160),
                              painter: MyPainter(),
                              child: Center(
                                child: Container(
                                  // color: Colors.orange,

                                  width: 20,
                                  height: 20,
                                  // color: Colors.yellow,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),

                            CustomPaint(
                              size: const Size(160, 160),
                              painter: MyPainter(),
                              child: Center(
                                child: Container(
                                  // color: Colors.orange,

                                  width: 20,
                                  height: 20,
                                  // color: Colors.yellow,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),

                            CustomPaint(
                              size: const Size(160, 160),
                              painter: MyPainter(),
                              child: Center(
                                child: Container(
                                  // color: Colors.orange,

                                  width: 20,
                                  height: 20,
                                  // color: Colors.yellow,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            CustomPaint(
                              size: const Size(160, 160),
                              painter: MyPainter(),
                              child: Center(
                                child: Container(
                                  // color: Colors.orange,
                                  width: 20,
                                  height: 20,
                                  // color: Colors.yellow,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            CustomPaint(
                              size: const Size(160, 160),
                              painter: MyPainter(),
                              child: Center(
                                child: Container(
                                  // color: Colors.orange,

                                  width: 20,
                                  height: 20,
                                  // color: Colors.yellow,
                                ),
                              ),
                            ),
                            const SizedBox(width: 100),

                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),

                  ],
                ),
            const SizedBox(height: 10),
            Container(
              color: Colors.white,
              child: CustomPaint(
                size: const Size(double.infinity, 150),
                painter: MyPainterLine(),
              ),
            ),
            const SizedBox(height: 5),
            Container(height: 150,width: double.infinity,color: Colors.green,)
          ],
        ),

        ),
      );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    var path = Path();
    // moveTo and  lineTo
    path.moveTo(20, 1);
    path.lineTo(28, 20);
    path.moveTo(20, 1);
    path.lineTo(12, 20);
    path.lineTo(12, 20);
    path.lineTo(32, 8);
    path.lineTo(8, 8);
    path.lineTo(28, 20);



    canvas.drawPath(path, paint);
    //lineTo and quadraticBezierTo

    // path.lineTo(0, size.height * 0.65);
    //
    // path.quadraticBezierTo(
    //   size.width * 0.2,
    //   size.height * 0.4,
    //   size.width * 0.5,
    //   size.height * 0.6,
    // );
    //
    // path.quadraticBezierTo(
    //   size.width * 0.8,
    //   size.height * 0.8,
    //   size.width,
    //   size.height * 0.5,
    // );
    // path.lineTo(size.width, 0);
    // path.close();
    // canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}


class MyPainterLuna extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final radius = min(size.width, size.height) / 2;
    final center = Offset(size.width / 2, size.height / 2);

    //Draw the body
    var paint = Paint()..color = Colors.yellow;
    canvas.drawCircle(center, radius, paint);
    //Draw the mouth
    final smilePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10;
    canvas.drawArc(
      Rect.fromCenter(center: center, width: radius, height: radius), 0,
      2*pi,
      false,
      smilePaint,
    );
    //Draw the eyes
    // canvas.drawCircle(
    //     Offset(center.dx - radius / 2, center.dy - radius / 2), 15, Paint());
    // canvas.drawCircle(
    //     Offset(center.dx + radius / 2, center.dy - radius / 2), 15, Paint());
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}


class MyPainterTwo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final radius = min(size.width, size.height);
    final center = Offset(50, -50);

    //Draw the body
    // var paint = Paint()..color = Colors.yellow;
    // canvas.drawCircle(center, radius, paint);
    //Draw the mouth
    final smilePaint = Paint()
    ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square
      ..strokeWidth = 6;
    canvas.drawArc(
      Rect.fromCenter(center: center, width: radius, height: radius), 0,
      pi,
      false,
      smilePaint,
    );
    //Draw the eyes
    // canvas.drawCircle(
    //     Offset(center.dx - radius / 2, center.dy - radius / 2), 15, Paint());
    // canvas.drawCircle(
    //     Offset(center.dx + radius / 2, center.dy - radius / 2), 15, Paint());
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class MyPainterLine extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // print(size.width);
    // print(size.height);
    var paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 8.0;

    canvas.drawLine(
      Offset(0, 0),//(100,100)
      Offset(395, 0),//(200,100)
      paint,
    );
    canvas.drawLine(
      Offset(0, 150),//(100,100)
      Offset(395, 150),//(200,100)
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
class MyPainterMoon extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Rect rect =  Offset(20, 10) &  Size(60, 70);
    const startAngle = pi/2-0.3;
    // const sweepAngle = sweepAngle;
    const useCenter = true;
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 6;

    Rect rect2 =  Offset(30, 10) &  Size(60, 70);
    const startAngle2 = pi/2;
    // const sweepAngle = sweepAngle;
    const useCenter2 = true;
    final paint4 = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill
      ..strokeWidth = 6;

    canvas.drawArc(rect, startAngle, pi+0.5, false, paint);
    canvas.drawArc(rect2, startAngle2, pi, false, paint4);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}