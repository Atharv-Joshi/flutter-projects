import 'package:flutter/material.dart';

class HeadingText extends StatelessWidget {
  final text;

  HeadingText(
  {
    required this.text
}
      );

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700
      ),
    );
  }
}
