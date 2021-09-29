import 'package:flutter/material.dart';
import 'package:localbitz/constants/decoration.dart';
import 'package:localbitz/screens/home.dart';
import 'package:localbitz/widgets/buttons/largeButtonTemplate.dart';
import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';
import '../../services/apiCalls/customerApiCalls.dart';

class SignUpForm extends StatefulWidget {


  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {

  final _formKey = GlobalKey<FormState>();

  String email='';
  String userName='';
  String password='';

  CustomerApiCalls _apiCalls = CustomerApiCalls();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0,40,0,40),
      child: Form(
        key: _formKey,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                width: MediaQuery.of(context).size.width * 0.73,
                height: MediaQuery.of(context).size.height * 0.06,
                child: TextFormField(
                  validator: (value){
                   if(EmailValidator.validate(value ?? '')){
                     email = value!;
                     return null;
                   }
                   return 'Please enter a valid email Id!';

                  },
                  decoration: borderDecoration.copyWith(hintText: 'Email address'),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                width: MediaQuery.of(context).size.width * 0.73,
                height: MediaQuery.of(context).size.height * 0.06,
                child: TextFormField(
                  validator: (value){
                    value = value!.trim();
                    userName = value;
                    return null;
                  },
                  decoration: borderDecoration.copyWith(hintText: 'Username'),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                width: MediaQuery.of(context).size.width * 0.73,
                height: MediaQuery.of(context).size.height * 0.06,
                child: TextFormField(
                  obscureText: true,
                  validator: (value){
                    if(value!.length >= 7){
                      password = value;
                      return null;
                    }
                    return 'Minimum length is 7 characters!';
                  },
                  decoration: borderDecoration.copyWith(hintText: 'Password'),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                width: MediaQuery.of(context).size.width * 0.73,
                height: MediaQuery.of(context).size.height * 0.06,
                child: TextFormField(
                  obscureText: true,
                  validator: (value){
                    if(value == password){
                      return null;
                    }
                    return 'passwords don\'t match!';
                  },
                  decoration: borderDecoration.copyWith(hintText: 'Confirm Password'),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 80),
                  child: LargeButtonTemplate(text: 'Sign Up', function: () async {
                    if(_formKey.currentState!.validate()){
                      var customer = await _apiCalls.registerCustomer(email, userName, password);
                      if(customer.runtimeType == String){
                        Get.snackbar('Error', customer);
                      }
                      else{
                        Get.offAll(() => Home());
                      }
                    }
                  }, bgColor: 0xffF94144, textColor: 0xffFFFFFF, isArrow: true)
              ),
            ],
          )
      ),
    );
  }
}