import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home.dart';

class PhoneVerification extends StatefulWidget {
  final String phone;

  PhoneVerification(this.phone);

  @override
  _PhoneVerificationState createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {

  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  String _verificationCode = '';
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: const Color.fromRGBO(43, 46, 66, 1),
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: const Color.fromRGBO(126, 203, 224, 1),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      body: Container(
        margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Verify Phone',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Code is sent to +91 ${widget.phone}.',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),

            Padding(
              padding: const EdgeInsets.all(30.0),
              child: PinPut(
                fieldsCount: 6,
                textStyle: const TextStyle(fontSize: 25.0, color: Colors.white),
                eachFieldWidth: 40.0,
                eachFieldHeight: 55.0,
                focusNode: _pinPutFocusNode,
                controller: _pinPutController,
                submittedFieldDecoration: pinPutDecoration,
                selectedFieldDecoration: pinPutDecoration,
                followingFieldDecoration: pinPutDecoration,
                pinAnimationType: PinAnimationType.fade,
                onSubmit: (pin) async {
                  try {
                    await FirebaseAuth.instance
                        .signInWithCredential(PhoneAuthProvider.credential(
                            verificationId: _verificationCode, smsCode: pin))
                        .then((value) async {
                      if (value.user != null) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Home()),
                            (route) => false);
                      }
                    });
                  } catch (e) {
                    FocusScope.of(context).unfocus();
                    _scaffoldkey.currentState
                        // ignore: deprecated_member_use
                        !.showSnackBar(SnackBar(content: Text('invalid OTP')));
                  }
                },
              ),
            ),



              Text(
                'Didn\'t  receive the code ? Request Again',
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
                width: double.infinity,
                height: 50,
                // ignore: deprecated_member_use
                child: RaisedButton(
                  color: const Color(0xff2E3B62),
                  elevation: 0,
                  onPressed: () {},
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                  child: Text(
                    'VERIFY AND CONTINUE',
                    style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 20,
                      color: const Color(0xffFFFFFF),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                  (route) => false);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verficationID, int? resendToken) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 120));
  }

  @override
  void initState() {
    super.initState();
    _verifyPhone();
  }
}
