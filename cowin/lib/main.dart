import 'package:cowin/screens/forgot_password_screen.dart';
import 'package:cowin/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      routes: {'/forgotpassword':(context) => ForgotPassword(),},
      home: LoginPage(),
    );
  }
}

