import 'package:flutter/material.dart';
import 'package:maple_intership_task/Widgets/Tiles/accounting_software_tile.dart';
import 'package:maple_intership_task/Widgets/heading_text.dart';


class AccountingSoftware extends StatelessWidget {
  const AccountingSoftware({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.only(bottom: 40),
              child: HeadingText(text: 'Select your Accounting \n Software')),
          AccountingSoftwareTile(image: 'assets/images/tally.png' , title: 'tally',),
          Container(
            margin: EdgeInsets.only(top: 40),
              child: AccountingSoftwareTile(image: 'assets/images/busy.png' , title: 'busy',)
          ),
        ],
      ),
    );
  }
}
