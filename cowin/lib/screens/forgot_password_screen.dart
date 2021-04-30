import 'package:flutter/material.dart';
import 'package:cowin/constant_widgets/constant_widgets.dart';

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: Center(
                  child: Column(
            
            children: [
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                  style: titleStyle.copyWith(color: Colors.indigo[800]),
                  text: 'C',
                ),
                WidgetSpan(
                    child: Icon(
                  Icons.add_circle_outlined,
                  color: Colors.amber[700],
                  size: 30,
                )),
                TextSpan(
                  text: 'WIN',
                  style: titleStyle.copyWith(color: Colors.indigo[800]),
                )
              ]
              )
              ),
              Text(
                'Winning over COVID',
                style: TextStyle(
                  color: Colors.indigo[800],
                  fontSize: 16,
                ),
              ),

            ],
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
        child: Form(
            child: Column(
              children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 0,horizontal: 30),
          child: TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                      focusedBorder: focusBorder,
                      enabledBorder: enabledBorder,
                      labelText: 'Mobile Number',
                    ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          child: TextButton(
            onPressed: () => (){},
            child: Text(
              'Send OTP',
              style: TextStyle(
                fontFamily: 'RobotoSlab',
                fontSize: 18,
              ),),
          ),
        )

              ],
            ),
            ),
      ),
    );
  }
}
