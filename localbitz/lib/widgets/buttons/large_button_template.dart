import 'package:flutter/material.dart';

class LargeButtonTemplate extends StatelessWidget {
  final String text;
  final function;
  final textColor;
  final bgColor;
  final bool isArrow;

  LargeButtonTemplate(
  {
    required this.text,
    required this.function,
    required this.bgColor,
    required this.textColor,
    required this.isArrow
}
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
      height: MediaQuery.of(context).size.height * 0.04,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(bgColor),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
          ))
        ),
        onPressed: function,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              ),
              if(isArrow) Icon(
                Icons.arrow_forward_sharp,
                color: Color(textColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
