import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBackButton extends StatefulWidget {
  const CustomBackButton({Key? key}) : super(key: key);

  @override
  _CustomBackButtonState createState() => _CustomBackButtonState();
}

class _CustomBackButtonState extends State<CustomBackButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 44,
        height: 44,
        child: TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xffF94144).withOpacity(.9),),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)
              ))
          ),
          onPressed: (){
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_sharp,
            color: Colors.white,
          ),
        )
    );
  }
}
