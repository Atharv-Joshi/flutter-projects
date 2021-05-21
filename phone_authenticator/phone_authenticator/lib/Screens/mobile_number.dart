import 'package:flutter/material.dart';
import 'package:phone_authenticator/Screens/phone_verification.dart';
import '../Widgets/curve.dart';

class MobileNumber extends StatefulWidget {
  @override
  _MobileNumberState createState() => _MobileNumberState();
}

class _MobileNumberState extends State<MobileNumber> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(0, 150, 0, 0),
        child: Center(
          child: Column(
            children: [
              Text(
                'Please enter your mobile number',
                style: TextStyle(
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'You\'ll receive a 6 digit code to verify next',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xff6A6C7B),
                  fontSize: 18
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color(0xff000000),
                        style: BorderStyle.solid,
                        width: 1.5)),
                width: double.infinity,
                child: Row(children: [
                  Image.asset(
                    'assets/flag.png',
                    height: 30,
                    width: 35,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    '+91    - ',
                    style: TextStyle(
                      fontSize: 20
                    ),),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 180,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Mobile Number',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      controller: _controller,
                    ),
                  ),
                ]),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
                width: double.infinity,
                height: 50,
                // ignore: deprecated_member_use
                child: RaisedButton(
                  color: const Color(0xff2E3B62),
                  elevation: 0,
                  onPressed: () {
                    print(_controller.text);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            PhoneVerification(_controller.text)));
                  },
                  shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                  child: Text(
                    'CONTINUE',
                    style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 20,
                      color: const Color(0xffFFFFFF),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Stack(children: [
                    ClipPath(
                      clipper: WaveClipperTwo1(reverse: true),
                      child: Container(
                        color: const Color.fromRGBO(147, 210, 243, 1),
                        height: 100,
                      ),
                    ),
                    ClipPath(
                      clipper: WaveClipperTwo2(reverse: true),
                      child: Container(
                        color: Color.fromRGBO(46, 59, 98, 0.5),
                        height: 100,
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
