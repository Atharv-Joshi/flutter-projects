import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:phone_authenticator/Screens/choose_language.dart';
import 'package:phone_authenticator/Screens/mobile_number.dart';





void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phone Number Authenticator',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),

      debugShowCheckedModeBanner: false,

      routes: {
        '/' : (ctx) => ChooseLanguage(),
        '/mobilenumber' : (ctx) => MobileNumber(),
        
      },
    );
  }
}

