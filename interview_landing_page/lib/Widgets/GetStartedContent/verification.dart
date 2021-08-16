import 'package:flutter/material.dart';
import 'package:interview_landing_page/constants/text/landing_page_text.dart';

class Verification extends StatelessWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: 538,
            height: 169,
            child: Text(
              'VERIFICATION MADE EASY',
              style: TextStyle(
                  fontSize: 60,
                  color: Colors.white
              ),
            ),
          ),
          Container(
            width: 570,
            height: 172,
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16
              ),
            ),
          ),
          Container(
            child: Row(
              children: [
                IconButton(
                    iconSize: 191.9 ,
                    onPressed: (){},
                    icon: Image.asset(
                      'assets/appStore2x.png',
                    )
                ),
                IconButton(
                    iconSize: 247.05 ,
                    onPressed: (){},
                    icon: Image.asset(
                      'assets/playStore.png',
                    ))
              ],
            ),
          ),
        ],
      )
    );
  }
}
