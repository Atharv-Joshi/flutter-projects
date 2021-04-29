import 'package:flutter/material.dart';

  OutlineInputBorder focusBorder =  OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                              color: Colors.pinkAccent,
                              ),
                        );

  OutlineInputBorder enabledBorder = OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                            color: Colors.greenAccent[700],
                            // width: 2.0,
                  ),
                ) ;

  TextStyle titleStyle = TextStyle(
    fontSize: 30,
    fontFamily: 'Raleway',
    fontWeight: FontWeight.bold,
    color: Colors.blue,
  );