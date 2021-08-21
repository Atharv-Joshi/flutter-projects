import 'package:flutter/material.dart';
import 'package:maple_intership_task/Constants/Decoration/text_field_decoration.dart';
import 'package:maple_intership_task/Controllers/uid_controller.dart';
import 'package:maple_intership_task/Screens/avatar_template_screen.dart';
import 'package:maple_intership_task/Services/authentication.dart';
import 'package:maple_intership_task/Widgets/Buttons/large_button_template.dart';
import 'package:maple_intership_task/Widgets/PagePotential/connect_channels.dart';
import 'package:get/get.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  Authentication _authentication = Authentication();

  UIDController _uidController = Get.put(UIDController());

  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: TextFormField(
                decoration: textFieldDecoration.copyWith(hintText: 'Enter your email'),
                validator: (value){
                  if(value != null){
                    email = value;
                    return null;
                  }
                  return 'Enter a email';
                },
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: TextFormField(
                decoration: textFieldDecoration.copyWith(hintText: 'Enter your password'),
                obscureText: true,
                validator: (value){
                  if(value != null){
                    password = value;
                    return null;
                  }
                  return 'Enter a email';
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: TextButton(
                onPressed: null,
                child: Text(
                  'Forgot Password',
                  style: TextStyle(
                    color: Color(0xff00A18C),
                    fontWeight: FontWeight.w300
                  ),
                ),
              ),
            ),
            LargeButtonTemplate(
                text: 'Sign in',
                function: () async {
                  if(_formKey.currentState!.validate()){
                    final user = await _authentication.loginEmailAndPassword(email!, password!);
                    if(user.runtimeType != String){
                      _uidController.updateUID(user.uid);
                      print(user);
                      Get.to(() => AvatarTemplateScreen(child: ConnectChannels(),));
                    }
                    else{
                      Get.snackbar('Registration Failed', user);
                    }
                  }
                }),
          ],
        ),
      ),
    );
  }
}
