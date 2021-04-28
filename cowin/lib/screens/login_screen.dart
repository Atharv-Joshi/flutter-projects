import 'dart:ui';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(children: [
          SizedBox(
            height: 30,
          ),
          SafeArea(
              child: Center(
            child: Text(
              'COWIN',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 30,
              ),
            ),
          )),
          Text(
            'Winning over COVID',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Image(
            image: AssetImage('assets/login_picture.png'),
            width: MediaQuery.of(context).size.width * .75,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Welcome!',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 26,
            ),
          ),
          Text(
            'Vaccinator & Verifier',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 20,
            ),
          ),
          Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Mobile Number',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.55,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.blue)))),
                      onPressed: () {},
                      child: Text('Login')),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Or'),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.55,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.blue)))),
                      onPressed: () {},
                      child: Text('Login using OTP')),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
