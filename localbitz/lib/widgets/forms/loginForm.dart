import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:localbitz/constants/decoration.dart';
import 'package:localbitz/controllers/authentication_form_controller.dart';
import 'package:localbitz/services/apiCalls/customer_api_calls.dart';
import 'package:get/get.dart';

class LoginForm extends StatefulWidget {

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

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
                'Login',
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
                          _authenticationFormController.updateIsLogIn(false);
                        });
                      },
                      child: Text('create an account'))
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
                width: MediaQuery.of(context).size.width * 0.17,
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
              SizedBox(
                height: 30,
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.17,
                color: isHovering ? Colors.black : Colors.red,
                child: InkWell(
                  onHover: (value){
                    setState(() {
                      isHovering = value;
                    });
                  },
                  onTap: () async {
                    if(_formKey.currentState!.validate()) {
                      setState(() {
                        isAPICallDone = false;
                      });
                      var customer = await _apiCalls.loginCustomer(email, password);
                      setState(() {
                        isAPICallDone = true;
                      });
                      if(customer.runtimeType == String){
                        Get.snackbar('Error', customer);
                      }
                      else{
                        Get.offNamed('/home');
                      }
                    }
                  },
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),
              !isAPICallDone ? CircularProgressIndicator(
                color: Colors.black,
              ) : Container()
            ],
          )
      ),
    );
  }
}
