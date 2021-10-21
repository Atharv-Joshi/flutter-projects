import 'package:flutter/material.dart';
import 'my_painter.dart';

class DynamicRingWidget {
  static  Widget buildRingAnimation({required double height, required double width, required double percentValue}){
    return Center(
      child: SizedBox(
        height: height,
        width: width,
        child: CustomPaint(
          foregroundPainter: ButtonPainter(
              buttonBorderColor: Colors.grey,
              progressColor: Colors.greenAccent,
              percentage: percentValue,
              width: 8.0
          ),
        ),
      ),
    );
  }
}