import 'package:flutter/material.dart';
import 'package:interview_landing_page/Widgets/ProfileCard/profile_card.dart';

class ProfileTypes extends StatelessWidget {
  const ProfileTypes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/profileTypesBg.png',),
          fit: BoxFit.cover
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 118),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 118),
              child: Text(
                  'PROFILE TYPES',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40
                  ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ProfileCard(image: 'assets/directory.png', title: 'BUSINESS/INDIVIDUAL USER'),
                ProfileCard(image: 'assets/document.png', title: 'BUSINESS ISSUING INSTITUTION'),
                ProfileCard(image: 'assets/phone.png', title: 'BUSINESS 3RD PARTY VERIFIER')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
