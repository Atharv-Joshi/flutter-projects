import 'package:flutter/material.dart';
import 'package:maple_intership_task/Screens/registration_screen.dart';
import 'package:maple_intership_task/Widgets/Buttons/large_button_template.dart';
import 'package:maple_intership_task/Widgets/bg_images.dart';
import 'package:get/get.dart';
import 'package:maple_intership_task/Widgets/heading_text.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEEEEEE),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              BackGroundImages(manBooks: true,),
              Container(
                margin: EdgeInsets.symmetric(vertical: 25),
                child: HeadingText(text: 'Be on top of your \n e-commerce business',),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Text(
                    'Lorem ipsum dolor sit amet, \n consectetur adipiscing elit. \n Integer sed sapien',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,

                  ),
                ),
              ),
              LargeButtonTemplate(
                text: 'Get Started',
                function: (){
                  Get.off(() => RegistrationScreen());
                  },
              ),
            ],
          ),

        ),
      ),
    );
  }
}
