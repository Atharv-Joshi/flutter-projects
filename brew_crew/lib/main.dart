import 'package:brew_crew/models/my_user.dart';
import 'package:brew_crew/screens/wrapper.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: missing_required_param
    return StreamProvider<MyUser>.value(
      value: AuthService().userStream,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}