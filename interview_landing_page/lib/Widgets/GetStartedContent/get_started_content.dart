import 'package:flutter/material.dart';
import 'package:interview_landing_page/Widgets/GetStartedContent/verification.dart';
class GetStartedContent extends StatelessWidget {
  const GetStartedContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/bigLogo.png',
                height: 577,
                width: 578,
              ),
              SizedBox(
                width: 256,
              ),
              Verification()
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 128),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  iconSize: 52,
                    onPressed: (){},
                    icon: Image.asset(
                      'assets/downArrow.png',
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
