import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localbitz/screens/login.dart';
import 'package:localbitz/screens/signup.dart';
import 'package:localbitz/widgets/buttons/largeButtonTemplate.dart';

class GettingStarted extends StatelessWidget {
  const GettingStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
        width: double.infinity,
        child: Column(
          children: [
            Image.asset('assets/images/logo.png'),
            Container(
              margin: EdgeInsets.fromLTRB(0,40,0,10),
              child: Text(
                'LocalBitz',
                style: TextStyle(
                  fontSize: 62,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffF94144)
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 60),
              child: Text(
                'A food delivery app',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff2E3A59)
                ),
              ),
            ),
            LargeButtonTemplate(text: 'Sign Up', function: (){
              Get.to(() => SignUp());
            }, bgColor: 0xffF94144, textColor: 0xffFFFFFF, isArrow: false),
            LargeButtonTemplate(text: 'Login', function: (){
              Get.to(() => Login());
            }, bgColor: 0xffFFFFFF, textColor: 0xffF94144, isArrow: true,)
          ],
        ),
      ),
    );
  }
}

