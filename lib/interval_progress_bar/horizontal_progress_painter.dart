import 'dart:ui';

import 'package:flutter/material.dart';

class HorizontalProgressPainter extends CustomPainter {
  final int progress;
  final Color highlightColor;
  final Color defaultColor;
  final double height;

  static const TRANSPARENT = Color.fromARGB(0, 0, 0, 0);

  late Paint painter;
  late Rect bound;

  HorizontalProgressPainter(
    this.progress,
    this.highlightColor,
    this.defaultColor,
      this.height,
  );

  @override
  void paint(Canvas canvas, Size size) {
    painter = Paint()
    ..style = PaintingStyle.fill
    ..isAntiAlias = true
    ..strokeWidth = height
    ..strokeCap = StrokeCap.round;

    canvas.drawLine(
        Offset.zero, Offset(size.width, 0.0), painter..color = defaultColor);
    canvas.drawLine(Offset.zero, Offset(size.width * (progress / 100), 0.0),
        painter..color = highlightColor);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
