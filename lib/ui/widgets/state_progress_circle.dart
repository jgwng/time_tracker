import 'dart:ui';
import 'package:flutter/material.dart';

class LevelProgressCircle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    Paint paint = Paint()
      ..color = Color.fromRGBO(242, 198, 65, 0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0; //내부의 작은 원의 두께
    canvas.drawCircle(center, 50, paint); //내부의 작은 원의 크기
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
      ..strokeWidth = 8.0
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(Rect.fromCircle(center: center, radius: 50), 4.71,
        percent * 6.28, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

}