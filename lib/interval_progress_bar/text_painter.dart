import 'dart:ui';

import 'package:flutter/material.dart';

class LegendPainter extends CustomPainter {
  final double height;
  final List<int>? intervalPercentages;
  final Color intervalColor;

  static const TRANSPARENT = Color.fromARGB(0, 0, 0, 0);

  late Paint painter;

  late Rect bound;

  double kTextWidth = 36;

  LegendPainter(
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
    /// this for zeroth legend
    paintText(null, "YYY", size, _widthCovered, canvas);
    for (int perc in intervalPercentages!) {
      _widthCovered+=perc;
      paintText("XXX", "YYY", size, _widthCovered, canvas);
    }


  }

  void paintText(String? upper, String? lower, Size size, int _widthCovered,
      Canvas canvas) {
    if (upper!=null) {
      _drawTextAt(
        upper,
        Offset(size.width * (_widthCovered / 100) - kTextWidth / 2, -height),
        canvas,
      );
    }
    if (lower!=null) {
      _drawTextAt(
        lower,
        Offset(size.width * (_widthCovered / 100) - kTextWidth / 2, height),
        canvas,
      );
    }

  }

  void _drawTextAt(String text, Offset position, Canvas canvas) {
    final textStyle = TextStyle(
      color: Colors.black,
      fontSize: 12,
    );
    final textSpan = TextSpan(
      text: text,
      style: textStyle,
    );
    final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.left);
    textPainter.layout(minWidth: 0, maxWidth: kTextWidth);
    Offset drawPosition =
    Offset(position.dx, position.dy - (textPainter.height / 2));
    textPainter.paint(canvas, drawPosition);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
