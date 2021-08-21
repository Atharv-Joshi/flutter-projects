import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Back extends StatelessWidget {
  const Back({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      width: 103,
      child: TextButton(
        style: ButtonStyle(
          side: MaterialStateProperty.all(BorderSide(
            color: Color(0xff00BFA6),
            width: 3
          ))
        ),
        onPressed: (){
          Get.back();
        },
        child: Text(
            '<< Back',
        style: TextStyle(
          fontSize: 20,
          color: Color(0xff00BFA6)
        ),),
      ),
    );
  }
}
