import 'package:flutter/material.dart';
import 'package:interview_landing_page/constants/decoration/textformfield_decoration.dart';

class ContactUsForm extends StatefulWidget {
  const ContactUsForm({Key? key}) : super(key: key);

  @override
  _ContactUsFormState createState() => _ContactUsFormState();
}

class _ContactUsFormState extends State<ContactUsForm> {
  @override
  Widget build(BuildContext context) {
    return  Form(
        child: Container(
          width: 522,
          child: Column(
            children: [
              Container(
                child: Material(
                  elevation: 15,
                  child: TextFormField(
                      decoration: textFormFieldDecoration.copyWith(hintText: 'Name')
                  ),
                ),

              ),
              SizedBox(height: 50,),
              Container(
                child: Material(
                  elevation: 15,
                  child: TextFormField(
                      decoration: textFormFieldDecoration.copyWith(hintText: 'Email')
                  ),
                ),

              ),
              SizedBox(height: 50,),
              Container(
                child: Material(
                  elevation: 15,
                  child: TextFormField(
                    minLines: 6,
                    maxLines: 10,
                    decoration: textFormFieldDecoration.copyWith(hintText: 'Message'),
                  ),
                ),

              ),
              SizedBox(height: 50,),
            ],
          ),
        )
    );
  }
}
