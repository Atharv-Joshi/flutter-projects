import 'package:flutter/material.dart';

import 'screens/gettingStarted.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LocalBitz',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: GettingStarted(),
    );
  }
}


