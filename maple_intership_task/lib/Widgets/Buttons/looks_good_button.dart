import 'package:flutter/material.dart';

class LooksGoodButton extends StatelessWidget {

  final function;

  LooksGoodButton(
  {
    required this.function
}
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff00BFA6),
      height: 84,
      width: 191,
      child: TextButton(
        onPressed: function,
        child: Text(
          'Looks Good >>',
          style: TextStyle(
              fontSize: 20,
              color: Colors.white
          ),),
      ),
    );
  }
}
