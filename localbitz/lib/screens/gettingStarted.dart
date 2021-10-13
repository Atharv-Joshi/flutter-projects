import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localbitz/screens/login.dart';
import 'package:localbitz/screens/signup.dart';
import 'package:localbitz/widgets/buttons/largeButtonTemplate.dart';

class SignupSignIn extends StatelessWidget {
  const SignupSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffEFEFEF).withOpacity(.2),
        width: double.infinity,
        child: Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
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
                    color: Color(0xffF94144).withOpacity(.9)
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
      ),
    );
  }
}

