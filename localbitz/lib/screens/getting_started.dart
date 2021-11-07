import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:localbitz/screens/Authentication/login.dart';
import 'package:localbitz/screens/Authentication/signup.dart';
import 'package:localbitz/widgets/buttons/large_button_template.dart';
import 'package:localbitz/widgets/footer.dart';
import 'package:localbitz/widgets/getting_started_info_template.dart';

class GettingStarted extends StatefulWidget {
  const GettingStarted({Key? key}) : super(key: key);
  @override
  State<GettingStarted> createState() => _GettingStartedState();
}

class _GettingStartedState extends State<GettingStarted> {

  Timer? timer;
  List<String> welcomeMessages = ['Hungry ?', 'Unexpected Guests ?', 'Cooking gone wrong ?', 'Movie marathon ?', 'Game night ?', 'Late night at office ?'];
  String? text;
  int counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    text = welcomeMessages[0];
    super.initState();
    timer = Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        text = welcomeMessages[counter % welcomeMessages.length];
        counter++;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffEFEFEF).withOpacity(.2),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset('assets/images/hero.jpg'),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.fromLTRB(160,0,0,10),
                                child: SelectableText(
                                  'LocalBitz',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.dosis(
                                    letterSpacing: 2,
                                    textStyle: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white
                                    )
                                  ),
                                ),
                              ),
                            ),
                            LargeButtonTemplate(text: 'Sign in', function: (){
                              Get.to(() => Login());
                            }, bgColor: Colors.transparent, textColor: Colors.white, isArrow: false,),
                            LargeButtonTemplate(text: 'Sign Up', function: (){
                              Get.to(() => SignUp());
                            }, bgColor: Colors.white, textColor: Colors.black, isArrow: false),

                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 120),
                          child: Text(
                              text!,
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 30),
                          child: Text(
                              'Order food from you favourite Chefs near you.',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric( vertical: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GettingStartedInfoTemplate(
                      image: 'assets/images/food-delivery.jpg',
                      title: 'Become a Delivery driver',
                      description: 'As a delivery driver you\'ll be making reliable money- working anytime, anywhere' ,
                      buttonTitle: 'Start earning',
                      onPressed: (){},
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      child: GettingStartedInfoTemplate(
                        image: 'assets/images/kitchen.jpg',
                        title: 'Become a Partner',
                        description: 'As a delivery driver you\'ll be making reliable money- working anytime, anywhere' ,
                        buttonTitle: 'Sign up your kitchen',
                        onPressed: (){},
                      ),
                    ),
                    GettingStartedInfoTemplate(
                      image: 'assets/images/mobile-app.jpg',
                      title: 'Try the App',
                      description: 'As a delivery driver you\'ll be making reliable money- working anytime, anywhere' ,
                      buttonTitle: 'Get the App',
                      onPressed: (){},
                    ),
                  ],
                ),
              ),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

