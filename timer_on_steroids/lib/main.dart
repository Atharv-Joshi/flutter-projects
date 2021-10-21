import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:timer_on_steroids/themes.dart';
import 'package:timer_on_steroids/wrapper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      // defaultThemeId: 1,
      themeCollection: themeCollection,
      builder: (context, theme){
        return GetMaterialApp(

          debugShowCheckedModeBanner: false,
          title: 'Timer On Steroids',
          theme: theme,
          home: const Wrapper(),
        );
      },
    );
  }
}

