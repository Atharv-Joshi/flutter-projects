import 'package:flutter/material.dart';
import 'package:maple_intership_task/Screens/registration_screen.dart';
import 'package:maple_intership_task/Widgets/Forms/login_form.dart';
import 'package:maple_intership_task/Widgets/bg_images.dart';
import 'package:maple_intership_task/Widgets/heading_text.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                    Container(
                        child: HeadingText(text: 'Welcome back!'),
                      margin: EdgeInsets.only(bottom: 10),
                    ),
                    Image.asset(
                        'assets/images/window.png',
                      width: 190,
                      height: 160,
                    ),
                    LoginForm(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            "Don't have an account?"
                        ),
                        TextButton(
                          onPressed: (){
                            Get.off(() => RegistrationScreen());
                          },
                          child: Text(
                            'Sign up',
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
