import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localbitz/constants/decoration.dart';
import 'package:localbitz/widgets/buttons/largeButtonTemplate.dart';
class SignUp extends StatefulWidget {
  

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color(0xffF94144),),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)
                        ))
                      ),
                      onPressed: (){
                        Get.back();
                      },
                      child: Icon(
                          Icons.arrow_back_sharp,
                        color: Colors.white,
                      ),
                    )
                  ),
                  Expanded(child: Container())
                ],
              ),
              Text(
                'Sign Up',
                style: TextStyle(
                  color: Color(0xffF94144),
                  fontSize: 36,
                    fontWeight: FontWeight.bold
                ),
              ),
              Form(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        width: MediaQuery.of(context).size.width * 0.73,
                        height: MediaQuery.of(context).size.height * 0.06,
                        child: TextFormField(
                          decoration: borderDecoration.copyWith(hintText: 'Email address'),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        width: MediaQuery.of(context).size.width * 0.73,
                        height: MediaQuery.of(context).size.height * 0.06,
                        child: TextFormField(
                          decoration: borderDecoration.copyWith(hintText: 'Username'),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        width: MediaQuery.of(context).size.width * 0.73,
                        height: MediaQuery.of(context).size.height * 0.06,
                        child: TextFormField(
                          decoration: borderDecoration.copyWith(hintText: 'Password'),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        width: MediaQuery.of(context).size.width * 0.73,
                        height: MediaQuery.of(context).size.height * 0.06,
                        child: TextFormField(
                          decoration: borderDecoration.copyWith(hintText: 'Confirm Password'),
                        ),
                      ),
                    ],
                  )
              ),
              LargeButtonTemplate(text: 'Sign Up', function: (){}, bgColor: 0xffF94144, textColor: 0xffFFFFFF, isArrow: true)
            ],
          ),
        ),
      )
    );
  }
}
