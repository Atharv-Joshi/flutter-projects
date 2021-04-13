import 'package:brew_crew/screens/authenticate/register.dart';
import 'package:brew_crew/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

import 'sign_in.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool shownSignIn = true;

  void toggleView() {
    setState(() => shownSignIn = !shownSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (shownSignIn == true) {
      return SignIn(toggleView: toggleView);
    } else {
      return Register(toggleView : toggleView );
    }
  }
}
