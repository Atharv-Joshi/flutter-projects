import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:flutter/material.dart';


class AppThemes {
  static const int light = 0;
  static const int dark = 1;
}

final themeCollection = ThemeCollection(
  themes: {
    //light theme
    AppThemes.light: ThemeData(
        primaryColor: Colors.white,
      primaryColorDark: Colors.grey[100],
      shadowColor: Colors.grey[400],
      dividerColor: Colors.black,
      dialogTheme:  DialogTheme(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        titleTextStyle: const TextStyle(
            color: Colors.deepPurpleAccent,
            fontSize: 20
        ),
        contentTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 16
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.deepPurpleAccent),
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black)
      ),
      textTheme: const TextTheme(
        bodyText1: TextStyle(
            fontSize: 30,
            color: Colors.black,
            fontWeight: FontWeight.bold
        ),
        bodyText2: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 17
        ),
        subtitle1: TextStyle(
            color: Colors.deepPurpleAccent,
            fontSize: 32,
            fontWeight: FontWeight.bold
        ),
      ),
    ),

    //dark theme
    AppThemes.dark: ThemeData(
      primaryColor: Colors.black,
      primaryColorDark: Colors.black87,
      dialogTheme: const DialogTheme(
        backgroundColor: Colors.black87,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.greenAccent,
          fontSize: 20
        ),
        contentTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 16
        ),
      ),
      shadowColor: Colors.grey,
      dividerColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.greenAccent),
      appBarTheme: const AppBarTheme(
          color: Colors.black,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white)
      ),
      textTheme: const TextTheme(
        bodyText1: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.bold
        ),
        bodyText2: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 17
        ),
        subtitle1: TextStyle(
            color: Colors.greenAccent,
            fontSize: 32,
            fontWeight: FontWeight.bold
        ),
      ),
    ),
  },
  fallbackTheme: ThemeData.light(),
);