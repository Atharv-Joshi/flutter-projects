import 'package:flutter/material.dart';
import 'package:localbitz/constants/decoration.dart';
import 'package:localbitz/controllers/authentication_form_controller.dart';
import 'package:localbitz/models/customer.dart';
import 'package:localbitz/widgets/buttons/large_button_template.dart';
import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';
import '../../services/apiCalls/customer_api_calls.dart';

class SignUpForm extends StatefulWidget {


  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {

  final _formKey = GlobalKey<FormState>();

  String email='';
  String userName='';
  String password='';

  bool isAPICallDone = true;
  bool isHovering = false;

  CustomerApiCalls _apiCalls = CustomerApiCalls();
  AuthenticationFormController _authenticationFormController = Get.find<AuthenticationFormController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(30,40,0,40),
      child: Form(
        key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: (){Navigator.pop(context);},
                icon: Icon(Icons.arrow_back ,),
                splashRadius: 20,
                hoverColor: Colors.grey[300],
              ),
              SelectableText(
                'Sign up',
                style: TextStyle(
                    fontSize: 26,
                    color: Colors.black
                ),
              ),
              Row(
                children: [
                  SelectableText('or'),
                  TextButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: (){
                        setState(() {
                          _authenticationFormController.updateIsLogIn(true);
                        });
                      },
                      child: Text('log into your account'))
                ],
              ),
              Container(
                width: 50,
                child: Divider(
                  color: Colors.black,
                  thickness: 2,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                width: MediaQuery.of(context).size.width * 0.17,
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
                width: MediaQuery.of(context).size.width * 0.17,
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
                width: MediaQuery.of(context).size.width * 0.17,
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
                width: MediaQuery.of(context).size.width * 0.17,
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
              SizedBox(
                height: 30,
              ),
              Container(
                height: 50,
                color: isHovering ? Colors.black : Colors.red,
                width: MediaQuery.of(context).size.width * 0.17,
                child: InkWell(
                  onHover: (value){
                    setState(() {
                      isHovering = value;
                    });
                  },
                  onTap: () async {
                    if(_formKey.currentState!.validate()){
                      setState(() {
                        isAPICallDone = false;
                      });
                      var response = await _apiCalls.registerCustomer(email, userName, password);
                      setState(() {
                        isAPICallDone = true;
                      });
                      if(response.runtimeType == String){
                        Get.snackbar('Error', response);
                      }
                      else{
                        Customer customer = response;
                        Get.offNamed('/home');
                      }
                    }
                  },
                  child: Center(
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),
              !isAPICallDone ? Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              ) : Container()
            ],
          )
      ),
    );
  }
}
