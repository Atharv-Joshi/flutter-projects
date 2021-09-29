import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:localbitz/constants/decoration.dart';
import 'package:localbitz/screens/home.dart';
import 'package:localbitz/services/apiCalls/customerApiCalls.dart';
import 'package:localbitz/widgets/buttons/largeButtonTemplate.dart';
import 'package:get/get.dart';

class LoginForm extends StatefulWidget {

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

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
                    if(EmailValidator.validate(value!)){
                      email = value;
                      return null;
                    }
                    return 'Enter a valid email Id!';
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
                  margin: EdgeInsets.only(bottom: 80),
                  child: LargeButtonTemplate(text: 'Login', function: () async {
                    if(_formKey.currentState!.validate()) {
                      var customer = await _apiCalls.loginCustomer(email, password);
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
