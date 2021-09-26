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
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      width: MediaQuery.of(context).size.width * 0.73,
      height: MediaQuery.of(context).size.height * 0.06,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color(bgColor)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
          ))
        ),
        onPressed: function,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                color: Color(textColor),
                fontSize: 20,
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
    );
  }
}
