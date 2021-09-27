import 'package:flutter/material.dart';
import 'package:localbitz/constants/decoration.dart';

class SignUpForm extends StatefulWidget {

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0,40,0,40),
      child: Form(
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
    );
  }
}
