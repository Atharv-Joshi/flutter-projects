import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maple_intership_task/Screens/login_screen.dart';
import 'package:maple_intership_task/Widgets/Forms/registration_form.dart';
import 'package:maple_intership_task/Widgets/bg_images.dart';
import 'package:maple_intership_task/Widgets/heading_text.dart';

class RegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEEEEEE),
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              BackGroundImages(manBooks: false),
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.55),
                child: Column(
                  children: [
                    HeadingText(text: 'Welcome onboard!'),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "Let's help you meet your tasks.",
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ),
                    RegistrationForm(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            'Already Registered?'
                        ),
                        TextButton(
                          onPressed: (){
                            Get.off(() => LoginScreen());
                          },
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                                color: Color(0xff00A18C)
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
