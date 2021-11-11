import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:localbitz/controllers/authentication_form_controller.dart';
import 'package:localbitz/widgets/footer.dart';
import 'package:localbitz/widgets/forms/loginForm.dart';
import 'package:localbitz/widgets/forms/signUpForm.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isLoginForm = true;
  AuthenticationFormController _authenticationFormController = Get.put(AuthenticationFormController());
  List _isHovering = [false, false,];

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
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar:  true,
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width , 1000),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 120,),
              Expanded(
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onHover: (value){
                      setState(() {
                        _isHovering[0] = value;
                      });
                    },
                    onTap: (){
                      setState(() {
                        _authenticationFormController.updateIsLogIn(true);
                        _scaffoldKey.currentState!.openEndDrawer();
                      });
                    },
                    child: Text(
                      'Log In',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Visibility(
                      maintainAnimation: true,
                      maintainState: true,
                      maintainSize: true,
                      visible: _isHovering[0],
                      child: Container(
                        height: 2,
                        width: 35,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onHover: (value){
                        setState(() {
                          _isHovering[1] = value;
                        });
                      },
                      onTap: (){
                        setState(() {
                          _authenticationFormController.updateIsLogIn(false);
                          _scaffoldKey.currentState!.openEndDrawer();
                        });
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Visibility(
                        maintainAnimation: true,
                        maintainState: true,
                        maintainSize: true,
                        visible: _isHovering[1],
                        child: Container(
                          height: 2,
                          width: 40,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
                      Container(
                        child: Stack(
                          children: [
                            Container(
                              child: Image.asset('assets/images/hero.jpg', fit: BoxFit.cover,),
                              height: MediaQuery.of(context).size.height * 0.45,
                              width: MediaQuery.of(context).size.width,
                            ),
                            Center(
                              child: Container(
                                // margin: EdgeInsets.all(10),
                                child: Column(
                                  children: [
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
                                        'Order food from favourite Chefs near you.',
                                        style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.white70,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric( vertical: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GettingStartedInfoTemplate(
                                image: 'assets/images/food-delivery.jpg',
                                title: 'Become a Delivery driver',
                                description: 'As a delivery driver you\'ll be making reliable money- working anytime, anywhere' ,
                                buttonTitle: 'Start earning',
                                onPressed: (){},
                              ),
                              Container(
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
                      ),
                      Footer()
            ],
            ),
        ),
      ),
      endDrawer: Container(
        width: MediaQuery.of(context).size.width * 0.35,
        child: Drawer(
          child: _authenticationFormController.isLogin.value ?  LoginForm() : SignUpForm(),
        ),
      ),
    );
  }
}

