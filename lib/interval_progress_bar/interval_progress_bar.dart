import 'package:flutter/material.dart';
import 'package:flutter_progress_example/interval_progress_bar/text_painter.dart';

import 'horizontal_progress_painter.dart';
import 'interval_painter.dart';



class IntervalProgressBar extends StatelessWidget {

  final double height;
  final List<int>? intervalPercentages;
  final int progressPercentage;

  IntervalProgressBar({
    Key? key,
    this.height = 50,
    this.intervalPercentages,
    this.progressPercentage = 0,
  }) : super(key: key) {
    assert(sumIntervals(intervalPercentages) == 100 );
  }

  int sumIntervals( List<int>? intervalPercentages) {
    int sum = 0 ;
    intervalPercentages?.forEach((element) => sum+=element);
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            CustomPaint(
              painter: HorizontalProgressPainter(
                progressPercentage,
                Colors.green,
                Colors.grey.withOpacity(0.6),
                height
              ),
              size:  Size(constraints.maxWidth*(0.8), 50),
            ),
            CustomPaint(
              painter: IntervalPainter(
                height,
                intervalPercentages,
                Colors.red,
              ),
              size:  Size(MediaQuery.of(context).size.width*(0.8), 50),
            ),
            CustomPaint(
              painter: LegendPainter(
                height,
                intervalPercentages,
                Colors.red,
              ),
              size:  Size(MediaQuery.of(context).size.width*(0.8), 50),
            ),
          ],
        );
      }
    );
  }
}
