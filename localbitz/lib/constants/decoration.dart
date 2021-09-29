import 'package:flutter/material.dart';

final borderDecoration = InputDecoration(
  filled: true,
  fillColor: Color(0xffFFFFFF),
  hintStyle: TextStyle(
      color: Color(0xff2C2929).withOpacity(.5)
  ),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(24),
      borderSide: BorderSide.none
  ),
);