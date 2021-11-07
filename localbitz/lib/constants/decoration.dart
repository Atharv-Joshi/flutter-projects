import 'package:flutter/material.dart';

final borderDecoration = InputDecoration(
  filled: true,
  fillColor: Color(0xffFFFFFF),
  hintStyle: TextStyle(
      color: Color(0xff2C2929).withOpacity(.5)
  ),
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(0),
      borderSide:  BorderSide(color:  Colors.grey[400] ?? Colors.grey , width: 1 , style:  BorderStyle.solid)
    // borderSide: BorderSide.none
  ),
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(0),
      borderSide:  BorderSide(color:  Colors.grey[400] ?? Colors.grey , width: 1 , style:  BorderStyle.solid)
    // borderSide: BorderSide.none
  ),
);