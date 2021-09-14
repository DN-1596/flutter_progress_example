import 'dart:ui';

import 'package:flutter/material.dart';

class IntervalPainter extends CustomPainter {
  final double height;
  final List<int>? intervalPercentages;
  final Color intervalColor;

  static const TRANSPARENT = Color.fromARGB(0, 0, 0, 0);

  late Paint painter;

  late Rect bound;

  IntervalPainter(
      this.height,
      this.intervalPercentages,
      this.intervalColor,
      );

  @override
  void paint(Canvas canvas, Size size) {
    painter = Paint()
      ..style = PaintingStyle.fill
      ..isAntiAlias = true
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.butt
      ..color = intervalColor;

    int _widthCovered = 0;
    for (int perc in intervalPercentages!) {
      _widthCovered+=perc;
      if (0 < _widthCovered && _widthCovered < 100) {
        canvas.drawLine(
          Offset(size.width * (_widthCovered / 100), -height/2),
          Offset(size.width * (_widthCovered / 100), height/2),
          painter,
        );
      }
    }


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
