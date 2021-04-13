import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/shared/constants.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // ignore: unused_field
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  String email;
  String password;
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading? Loading() : Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign up to Brew Crew'),
        actions: [
          TextButton.icon(
              onPressed: () {
                widget.toggleView();
              },
              icon: Icon(
                Icons.person_add,
                color: Colors.black,
              ),
              label: Text(
                'Sign In',
                style: TextStyle(color: Colors.black),
              ))
        ],
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Email'),
                  validator: (value) => value.isEmpty ? 'Enter Email-Id' : null,
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Password'),
                  validator: (value) =>
                      value.length < 6 ? 'Enter Password 6+ char long' : null,
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                // ignore: deprecated_member_use
                RaisedButton(
                  onPressed: () async {
                    if (_formkey.currentState.validate()) {
                      setState(() {
                        loading = true;
                      });
                      dynamic result =
                          await _auth.registerEmailAndPassword(email, password);

                      if (result == null) {
                        setState(() {
                          loading = false;
                          error = 'Enter a valid email';
                        });
                      }

                      print(email);
                      print(password);
                    }
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.pink[400],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  error,
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
