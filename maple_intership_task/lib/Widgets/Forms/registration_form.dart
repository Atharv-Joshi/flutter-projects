import 'package:flutter/material.dart';
import 'package:maple_intership_task/Constants/Decoration/text_field_decoration.dart';
import 'package:maple_intership_task/Controllers/personal_details_controller.dart';
import 'package:maple_intership_task/Controllers/uid_controller.dart';
import 'package:maple_intership_task/Screens/avatar_template_screen.dart';
import 'package:maple_intership_task/Services/authentication.dart';
import 'package:maple_intership_task/Widgets/Buttons/large_button_template.dart';
import 'package:get/get.dart';
import 'package:maple_intership_task/Widgets/PagePotential/connect_channels.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {

  String? name;
  String? email;
  String? password;

  Authentication _authentication = Authentication();

  PersonalDetailsController _detailsController = Get.put(PersonalDetailsController());
  UIDController _uidController = Get.put(UIDController());

  final _formKey = GlobalKey<FormState>();
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
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Enter a name';
                  }
                  name = value;
                  return null;
                },
                decoration: textFieldDecoration.copyWith(hintText: 'Enter your full name'),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: TextFormField(
                validator: (value){
                  if(value == null || !value.contains('@')){
                    return 'Enter a email';
                  }
                  email = value;
                  return null;
                },
                decoration: textFieldDecoration.copyWith(hintText: 'Enter your email'),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: TextFormField(
                obscureText: true,
                validator: (value){
                  if(value == null || value.length <8){
                    return 'Password Length must be atleast 8 characters';
                  }
                  password = value;
                  return null;
                },
                decoration: textFieldDecoration.copyWith(hintText: 'Enter your password'),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: TextFormField(
                obscureText: true,
                validator: (value){
                  if(value == null || value != password){
                    return 'Password different!';
                  }
                  return null;
                },
                decoration: textFieldDecoration.copyWith(hintText: 'Confirm password'),
              ),
            ),
            LargeButtonTemplate(
                text: 'Register',
                function: () async {
                  if(_formKey.currentState!.validate()){
                    //firebase code
                    final user = await _authentication.registerEmailAndPassword(email!, password!);
                    if(user.runtimeType != String){
                      _uidController.updateUID(user.uid);
                      _detailsController.updatePD(name, email, password);
                      print(user);
                      Get.to(() => AvatarTemplateScreen(child: ConnectChannels(),));
                    }
                    else{
                      Get.snackbar('Registration Failed', user);
                    }
                  }

                }
                ),
          ],
        ),
      ),
    );
  }
}
