import 'package:flutter/material.dart';
import 'my_painter.dart';

class DynamicRingWidget {
  static  Widget buildRingAnimation({required double height, required double width, required double percentValue, required ThemeData theme}){
    return Center(
      child: SizedBox(
        height: height,
        width: width,
        child: CustomPaint(
          foregroundPainter: ButtonPainter(
              buttonBorderColor:theme.shadowColor,
              progressColor: theme.iconTheme.color!,
              percentage: percentValue,
              width: 8.0
          ),
        ),
      ),
    );
  }
}