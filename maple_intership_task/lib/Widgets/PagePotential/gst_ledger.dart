import 'package:flutter/material.dart';
import 'package:maple_intership_task/Widgets/Buttons/back_button.dart';
import 'package:maple_intership_task/Widgets/Buttons/looks_good_button.dart';
import 'package:maple_intership_task/Widgets/Tiles/gst_ledgers_tile.dart';
import 'package:maple_intership_task/Widgets/heading_text.dart';

class GstLedgers extends StatelessWidget {
  const GstLedgers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20,30,20,0),
      child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 30),
              child: HeadingText(text: 'Configure Tally Masters',),
            ),
            Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HeadingText(text: 'GST Ledgers?'),
                    Icon(Icons.info_outlined)
                  ],
                )
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.44,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    GSTLedgersTile(image: 'assets/images/amazon_logo_small.png', type: 'IGST',),
                    GSTLedgersTile(image: 'assets/images/amazon_logo_small.png', type: 'CGST',),
                    GSTLedgersTile(image: 'assets/images/amazon_logo_small.png', type: 'SGST',),
                    GSTLedgersTile(image: 'assets/images/amazon_logo_small.png', type: 'CESS',),
                    Container(
                        margin: EdgeInsets.only(top: 20),
                        child: GSTLedgersTile(image: 'assets/images/Vector.png', type: 'IGST',)
                    ),
                  ],
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Back(),
                  LooksGoodButton(function: (){
                    // Get.to(() => )
                  },)
                ],
              ),
            ),
          ],
      ),
    );
  }
}
