import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final AuthService _auth = AuthService();

    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text('Brew Crew'),
        actions: <Widget>[
          TextButton.icon(

              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.logout,
              color: Colors.black,),
              label: Text('Logout',
                          style: TextStyle(
                            color: Colors.black,
                          ),
              )),
        ],
      ),
    );
  }
}