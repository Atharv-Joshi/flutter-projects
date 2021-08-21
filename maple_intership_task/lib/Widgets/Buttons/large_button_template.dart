import 'package:flutter/material.dart';

class LargeButtonTemplate extends StatelessWidget {
  final String text;
  final function;

  LargeButtonTemplate(
  {
    required this.text,
    required this.function
}
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: function,
        child: Text(
            text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18
        ),),
      ),
    );
  }
}
