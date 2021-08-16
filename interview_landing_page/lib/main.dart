import 'package:flutter/material.dart';
import 'package:interview_landing_page/Pages/landing_page_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Landing Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LandingPageScreen()
    );
  }
}

