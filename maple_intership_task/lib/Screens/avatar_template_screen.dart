import 'package:flutter/material.dart';

class AvatarTemplateScreen extends StatelessWidget {

  final child;

  AvatarTemplateScreen(
      {
        required this.child
      }
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Stack(
          children: [
            Container(
              color: Color(0xff00BFA6).withOpacity(0.53),
              height: MediaQuery.of(context).size.height * 0.18,
            ),
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.12),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/pfp.jpg'),
                    radius: 40,
                  ),
                  child
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
