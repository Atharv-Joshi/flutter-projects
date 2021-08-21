import 'package:flutter/material.dart';
import 'package:maple_intership_task/Screens/avatar_template_screen.dart';
import 'package:maple_intership_task/Widgets/Buttons/back_button.dart';
import 'package:maple_intership_task/Widgets/Buttons/looks_good_button.dart';
import 'package:maple_intership_task/Widgets/PagePotential/gst_ledger.dart';
import 'package:maple_intership_task/Widgets/heading_text.dart';
import 'package:maple_intership_task/Widgets/Tiles/partymaster_tile.dart';

class TallyMasters extends StatelessWidget {
  const TallyMasters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20,40,20,0),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 40),
            child: HeadingText(text: 'Configure Tally Masters',),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HeadingText(text: 'Party Master?'),
                Icon(Icons.info_outlined)
              ],
            )
          ),
          PartyMasterTile(logo: 'assets/images/amazon_logo_small.png', title: 'Amazon India'),
          Container(
              margin: EdgeInsets.only(top: 30),
              child: PartyMasterTile(logo: 'assets/images/Vector.png', title: 'Flipkart India')
          ),
          Container(
            margin: EdgeInsets.only(top: 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Back(),
                LooksGoodButton(function: (){
                  Navigator.push(context, MaterialPageRoute(builder: (ctx) => AvatarTemplateScreen(child: GstLedgers())));
                },)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
