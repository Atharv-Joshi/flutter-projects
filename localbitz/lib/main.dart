import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/gettingStarted.dart';

void main()  {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LocalBitz',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: GettingStarted(),
    );
  }
}

