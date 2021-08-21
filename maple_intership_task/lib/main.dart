import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:maple_intership_task/Screens/get_started_screen.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xff00BFA6))
          )
        ),
      ),
      home: GetStartedScreen(),
    );
  }
}




