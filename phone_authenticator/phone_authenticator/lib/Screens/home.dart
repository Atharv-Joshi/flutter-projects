import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'mobile_number.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // late String uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MobileNumber()),
                  (route) => false);
            },
          )
        ],
      ),
      body: Center(
        child: Text('Hello there'),
      ),
    );
  }

  @override
  void initState() {

    super.initState();
    // uid = FirebaseAuth.instance.currentUser.uid;
  }
}