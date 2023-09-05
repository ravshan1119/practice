import 'dart:ui';

import 'package:flutter/material.dart';

class QorBola extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.indigo,
      appBar: AppBar(
        // backgroundColor: Colors.indigo,
        title: Text('Qorbola'),
      ),
      body: Stack(
        children: [
          Center(
            child: CustomPaint(
              size: Size(200, 400),
              painter: SnowmanPainter(),
            ),
          ),
          Center(
            child: CustomPaint(
              size: Size(200, 400),
              painter: MyPainter(),
            ),
          ),
          Center(
            child: CustomPaint(
              size: Size(200, 400),
              painter: MyPainter1(),
            ),
          ),
        ],
      ),
    );
  }
}

class SnowmanPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint blackPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3;

    final Paint buttonPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;

    final Paint nosePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;

    final Paint whiteFillPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height * 0.75),
        width: 180,
        height: 140,
      ),
      whiteFillPaint,
    );
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height * 0.75),
        width: 180,
        height: 140,
      ),
      blackPaint,
    );
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height * 0.5),
        width: 140,
        height: 120,
      ),
      whiteFillPaint,
    );
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height * 0.5),
        width: 140,
        height: 120,
      ),
      blackPaint,
    );

    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height * 0.3),
        width: 100,
        height: 90,
      ),
      whiteFillPaint,
    );
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height * 0.3),
        width: 100,
        height: 90,
      ),
      blackPaint,
    );
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height * 0.2),
        width: 110,
        height: 30,
      ),
      blackPaint,
    );
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height * 0.2),
        width: 108,
        height: 28,
      ),
      whiteFillPaint,
    );

    final double squareSize = 60.0;
    final double squareLeft = (size.width - squareSize) / 2;
    final double squareTop = size.height * 0.05;
    final double borderRadius = 10.0;

    final roundedRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(squareLeft, squareTop, squareSize, squareSize),
      Radius.circular(borderRadius),
    );

    canvas.drawRRect(
      roundedRect,
      whiteFillPaint,
    );

    canvas.drawRRect(
      roundedRect,
      blackPaint,
    );

    canvas.drawCircle(
        Offset(size.width / 2 - 2, size.height * 0.27), 5, buttonPaint);
    canvas.drawCircle(
        Offset(size.width / 2 + 25, size.height * 0.27), 5, buttonPaint);

    canvas.drawCircle(
        Offset(size.width / 2 - 15, size.height * 0.35), 4, buttonPaint);
    canvas.drawCircle(
        Offset(size.width / 2 + 0, size.height * 0.36), 4, buttonPaint);
    canvas.drawCircle(
        Offset(size.width / 2 + 15, size.height * 0.36), 4, buttonPaint);
    canvas.drawCircle(
        Offset(size.width / 2 + 30, size.height * 0.346), 4, buttonPaint);

    final nosePath = Path();

    nosePath.moveTo(size.width * 0.54, size.height * 0.3);
    nosePath.lineTo(size.width * 0.83, size.height * 0.28);
    nosePath.lineTo(size.width * 0.55, size.height * 0.33);
    nosePath.close();
    canvas.drawPath(nosePath, whiteFillPaint);
    canvas.drawPath(nosePath, nosePaint);

    for (var i = 0; i < 3; i++) {
      canvas.drawCircle(Offset(size.width / 1.75, size.height * 0.47 + 20 * i),
          5, buttonPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class MyPainterLine extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // print(size.width);
    // print(size.height);
    var paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;

    canvas.drawLine(
      const Offset(150, 160),
      const Offset(300, 80),
      paint,
    );
    canvas.drawLine(
      const Offset(160, 160),
      const Offset(300, 100),
      paint,
    );

    canvas.drawLine(
      const Offset(60, 160),
      const Offset(0, 80),
      paint,
    );
    canvas.drawLine(
      const Offset(60, 160),
      const Offset(0, 100),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const points = [
      Offset(150, 156),
      Offset(200, 150),
      Offset(210, 140),
      Offset(200, 150),
      Offset(210, 160),
      Offset(200, 150),
      Offset(210, 140),
      Offset(200, 150),
      Offset(200, 150),
      Offset(210, 149),
    ];
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 3
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;
    canvas.drawPoints(PointMode.lines, points, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
class MyPainter1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const points = [
      Offset(40, 180),
      Offset(0, 150),
      Offset(0, 150),
      Offset(0, 140),
      Offset(0, 140),
      Offset(0, 150),
      Offset(10, 160),



      // Offset(200, 150),
      // Offset(210, 140),
      // Offset(200, 150),
      // Offset(200, 150),
      // Offset(210, 149),
    ];
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 3
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;
    canvas.drawPoints(PointMode.lines, points, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
