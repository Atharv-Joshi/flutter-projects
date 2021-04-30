import 'dart:ui';
import 'package:cowin/constant_widgets/constant_widgets.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hidePassword = true;

  Widget finalIcon;

  Widget lockIcon = Icon(
    Icons.lock,
    color: Colors.green,
    );

  Widget unlockIcon = Icon(
    Icons.lock_open,
    color: Colors.red,);

  @override
  Widget build(BuildContext context) {
    if (hidePassword == true) {
      finalIcon = lockIcon;
    } else {
      finalIcon = unlockIcon;
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            SafeArea(
                child: Center(
                    child: RichText(
                        text: TextSpan(children: [
              TextSpan(
                style: titleStyle,
                text: 'C',
              ),
              WidgetSpan(
                  child: Icon(
                Icons.add_circle_outlined,
                color: Colors.amber,
                size: 30,
              )),
              TextSpan(
                text: 'WIN',
                style: titleStyle,
              )
            ])))),
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
                fontFamily: 'RobotoSlab',
                color: Colors.blue[900],
                fontSize: 26,
              ),
            ),
            Text(
              'Vaccinator & Verifier',
              style: TextStyle(
                fontFamily: 'RobotoSlab',
                color: Colors.blue[900],
                fontSize: 20,
              ),
            ),
            Form(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 30),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        focusedBorder: focusBorder,
                        enabledBorder: enabledBorder,
                        labelText: 'Mobile Number',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 30),
                    child: TextFormField(
                      obscureText: hidePassword,
                      decoration: InputDecoration(
                          focusedBorder: focusBorder,
                          enabledBorder: enabledBorder,
                          labelText: 'Password',
                          suffixIcon: IconButton(
                              icon: finalIcon,
                              onPressed: () {
                                setState(() {
                                  hidePassword = !(hidePassword);
                                });
                              })),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/forgotpassword');
                      },
                      child: Text(
                        'Forgot Password?',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.55,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
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
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
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
      ),
    );
  }
}
