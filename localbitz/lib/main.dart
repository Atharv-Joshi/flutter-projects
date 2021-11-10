import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localbitz/screens/getting_started.dart';
import 'package:localbitz/screens/home.dart';

void main() {
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => GettingStarted()),
        GetPage(name: '/home', page: () => Home()),
      ],
      title: 'LocalBitz',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
    );
  }
}


