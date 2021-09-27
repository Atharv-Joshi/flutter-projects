import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localbitz/widgets/buttons/largeButtonTemplate.dart';
import 'package:localbitz/widgets/buttons/customBackButton.dart';
import 'package:localbitz/widgets/forms/loginForm.dart';
import 'package:localbitz/widgets/forms/signUpForm.dart';


class Login extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              color: Color(0xffEFEFEF).withOpacity(.2),
              width: double.infinity,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CustomBackButton(),
                        Expanded(child: Container())
                      ],
                    ),
                    Text(
                      'Login',
                      style: TextStyle(
                          color: Color(0xffF94144).withOpacity(.9),
                          fontSize: 36,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    LoginForm(),
                    Container(
                        margin: EdgeInsets.only(bottom: 80),
                        child: LargeButtonTemplate(text: 'Login', function: (){}, bgColor: 0xffF94144, textColor: 0xffFFFFFF, isArrow: true)
                    ),
                    Text(
                        'Forgot Password'
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}
