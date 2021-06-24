
import 'dart:math';

import 'package:flutter/material.dart';

class WheelCircle extends CustomPainter {
  double wheelSize;
  double longNeedleHeight;
  double shortNeedleHeight;
  BuildContext context;

  WheelCircle(
      {required this.wheelSize,
        required this.longNeedleHeight,
        required this.shortNeedleHeight,
        required this.context});


  double degreeToRadians(double degrees) => degrees * (pi / 180);

  double radianToDegrees(double radians) => radians * (180 / pi);

  @override
  void paint(Canvas canvas, Size size) {
    // final wheelBorder = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2.0
    //   ..color = Theme.of(context).textTheme.bodyText2.color;

    final shortNeedle = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = Colors.black;

    final longNeedle = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = Colors.black;

    // canvas.drawCircle(Offset(0, 0), wheelSize / 2, wheelBorder);
    // canvas.drawLine(Offset(0, -50), Offset(0, 0),
    //     wheelBorder); // <- this line is drawn just to help debug the angle. Comment this in prod.

    for (double i = 0; i <= 360; i++) {
      if (i % 20 != 0 && i % 10 == 0) {
        canvas.drawLine(
            Offset(( wheelSize / 2) * cos(degreeToRadians(i)),
                ( wheelSize / 2) * sin(degreeToRadians(i))),
            Offset((( wheelSize / 2) - longNeedleHeight) * cos(degreeToRadians(i)),
                (( wheelSize / 2) - longNeedleHeight) * sin(degreeToRadians(i))),
            longNeedle);
      } else {
        if (i % 5 == 0) {
          canvas.drawLine(
              Offset(( wheelSize / 2) * cos(degreeToRadians(i)),
                  ( wheelSize / 2) * sin(degreeToRadians(i))),
              Offset((( wheelSize / 2) - shortNeedleHeight) * cos(degreeToRadians(i)),
                  (( wheelSize / 2) - shortNeedleHeight) * sin(degreeToRadians(i))),
              shortNeedle);
        }
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}


