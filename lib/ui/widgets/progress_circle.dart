import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class LineCircle {
  ///give the center ,radius of the circle,
  ///and have radian from x clockwise direction.
  ///you can get the point coordinate in the circle.
  static Point radianPoint(Point center, double r, double radian) {
    return Point(center.x + r * cos(radian), center.y + r * sin(radian));
  }
}

class LevelProgressCircle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    Paint paint = Paint()
      ..color = Color.fromRGBO(242, 198, 65, 0.5)

      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;
    canvas.drawCircle(center, 25.0, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class LevelProgressArc extends CustomPainter {
  final double percent;

  LevelProgressArc(this.percent);

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    Paint paint = Paint()
      ..color = Color.fromRGBO(242, 198, 65, 1.0)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(Rect.fromCircle(center: center, radius: 25.0), 4.71,
        percent * 6.28, false, paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}